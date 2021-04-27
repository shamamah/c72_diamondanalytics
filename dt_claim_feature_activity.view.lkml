view: dt_claim_feature_activity {
  derived_table: {
    sql:

      SELECT O.claimcontrol_id, O.claimant_num, O.claimfeature_num, ROW_NUMBER() OVER (PARTITION BY O.claimcontrol_id, O.claimant_num, O.claimfeature_num ORDER BY O.num) AS num,
        O.added_date AS open_date, C.added_date AS close_date, first_open.first_open_date, lastest_closed.latest_close_date,
        DATEDIFF(dd,O.added_date,C.added_date) AS days_open, DATEDIFF(dd,first_open.first_open_date,lastest_closed.latest_close_date) AS days_open_cumulative
      FROM
          (
            SELECT claimcontrol_id, claimant_num, claimfeature_num, num, added_date, ROW_NUMBER() OVER (PARTITION BY claimcontrol_id, claimant_num, claimfeature_num ORDER BY num) AS RN
            FROM dbo.ClaimFeatureActivity
            WHERE claimactivitycode_id = 1
              AND {% condition dt_claim_feature_as_of_date.as_of_date %} added_date {% endcondition %}
          ) O

        LEFT OUTER JOIN
          (
            SELECT claimcontrol_id, claimant_num, claimfeature_num, num, added_date, ROW_NUMBER() OVER (PARTITION BY claimcontrol_id, claimant_num, claimfeature_num ORDER BY num) AS RN
            FROM dbo.ClaimFeatureActivity
            WHERE claimactivitycode_id = 2
          ) C
          ON C.claimcontrol_id = O.claimcontrol_id
            AND C.claimant_num = O.claimant_num
            AND C.claimfeature_num = O.claimfeature_num
            AND C.RN = O.RN

        LEFT OUTER JOIN
          (
            SELECT claimcontrol_id, claimant_num, claimfeature_num, min(added_date) as first_open_date --, ROW_NUMBER() OVER (PARTITION BY claimcontrol_id, claimant_num, claimfeature_num ORDER BY num) AS RN
            FROM dbo.ClaimFeatureActivity
            WHERE claimactivitycode_id = 1
            GROUP BY claimcontrol_id, claimant_num, claimfeature_num
          ) first_open
          ON first_open.claimcontrol_id = O.claimcontrol_id
            AND first_open.claimant_num = O.claimant_num
            AND first_open.claimfeature_num = O.claimfeature_num
            --AND first_open.RN = O.RN


        LEFT OUTER JOIN
          (
            SELECT claimcontrol_id, claimant_num, claimfeature_num, max(added_date) as latest_close_date
            FROM dbo.ClaimFeatureActivity
            WHERE claimactivitycode_id = 2
            GROUP BY claimcontrol_id, claimant_num, claimfeature_num
          ) lastest_closed
          ON lastest_closed.claimcontrol_id = O.claimcontrol_id
            AND lastest_closed.claimant_num = O.claimant_num
            AND lastest_closed.claimfeature_num = O.claimfeature_num
       ;;
  }

  dimension: compound_primary_key {
    type: string
    primary_key: yes
    hidden: yes
    sql: CONCAT(${claimcontrol_id},${claimant_num},${claimfeature_num},${num}) ;;
  }

  dimension: claimcontrol_id {
    hidden: yes
    type: number
    sql: ${TABLE}.claimcontrol_id ;;
  }

  dimension: claimant_num {
    hidden: yes
    type: number
    sql: ${TABLE}.claimant_num ;;
  }

  dimension: claimfeature_num {
    hidden: yes
    type: number
    sql: ${TABLE}.claimfeature_num ;;
  }

  dimension: num {
    label: "Open/Reopen Number"
    type: number
    sql: ${TABLE}.num ;;
  }

  dimension_group: open_date {
    label: "Opened"
    type: time
    timeframes: [date,month,year]
    sql: ${TABLE}.open_date ;;
  }

  dimension_group: close_date {
    label: "Closed"
    type: time
    timeframes: [date,month,year]
    sql: ${TABLE}.close_date ;;
  }

  dimension_group: first_open_date {
    label: "First Opened"
    type: time
    timeframes: [date,month,year]
    sql: ${TABLE}.first_open_date ;;
  }

  dimension_group: latest_close_date {
    label: "Latest Close"
    type: time
    timeframes: [date,month,year]
    sql: ${TABLE}.latest_close_date ;;
  }


  dimension: days_open {
    label: "Days Open to Close"
    type: number
    sql: ${TABLE}.days_open ;;
  }

  dimension: dim_days_open_cumulative {
    hidden: yes
    label: "Days First Open to Last Close"
    type: number
    sql: ${TABLE}.days_open_cumulative ;;
  }

  dimension : latest_closed_within {
    type: tier
    label: "Latest Closed Within (Tiers)"
    tiers: [31,61,91,181,366]
    style: integer
    sql: case when ${dim_days_open_cumulative} IS NULL
      then NULL
      else ${dim_days_open_cumulative} end ;;
    value_format: "0"
  }

  measure: count {
    label: "Count"
    type: count
    #sql: ${claimcontrol_id} and ${num} ;;
    drill_fields: [detail*]
  }

  measure: count_with_indemnity_paid {
    label: "Count with Paid Loss"
    type: count
    drill_fields: [claim_stat*]
    filters: {
      field: v_claim_detail_feature.indemnity_paid
      value: ">0"
    }
  }

  #SH 2020-04-20 Add a new data point to help with MCAS 20 counts
  measure: count_without_indemnity_paid {
    label: "Count without Paid Loss"
    type: count
    drill_fields: [claim_stat*]
    filters: {
      field: v_claim_detail_feature.indemnity_paid
      value: "=0"
    }
  }

  set: detail {
    fields: [
      claim_control.claim_number,
      claimant_num,
      claimfeature_num,
      num,
      open_date_date,
      close_date_date,
      first_open_date_date,
      latest_close_date_date,
      days_open,
      dt_date_latest_indemnity_payment.max_check_date_date,
      v_claim_detail_feature.sum_indemnity_paid,
      v_claim_detail_feature.sum_indemnity_reserve,
      v_claim_detail_feature.sum_expense_paid
    ]
  }

  set: claim_stat {
    fields: [
      claim_control.claim_number,
      claimant_num,
      claimfeature_num,
      num,
      open_date_date,
      close_date_date,
      first_open_date_date,
      latest_close_date_date,
      days_open,
      policy.current_policy,
      claim_type.dscr,
      claim_severity.dscr,
      claim_control.loss_date_date,
      dt_date_latest_indemnity_payment.max_check_date_date,
      v_claim_detail_feature.sum_indemnity_paid,
      v_claim_detail_feature.sum_indemnity_reserve,
      v_claim_detail_feature.sum_expense_paid
    ]
  }
}
