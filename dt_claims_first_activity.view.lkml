view: dt_claims_first_activity {
  derived_table: {
    sql: SELECT O.claimcontrol_id, ROW_NUMBER() OVER (PARTITION BY O.claimcontrol_id ORDER BY O.num) AS num, O.added_date AS opened, C.added_date AS closed, C.dscr
      FROM
      (
        SELECT claimcontrol_id, num, added_date, ROW_NUMBER() OVER (PARTITION BY claimcontrol_id ORDER BY num) AS RN
        FROM dbo.ClaimControlActivity
        WHERE claimactivitycode_id = 1
          AND {% condition dt_claim_transactions_as_of.as_of_date %} added_date {% endcondition %}
      ) O
      LEFT OUTER JOIN
      (
        SELECT claimcontrol_id, num, added_date, dscr, ROW_NUMBER() OVER (PARTITION BY claimcontrol_id ORDER BY num) AS RN
        FROM dbo.ClaimControlActivity
        WHERE claimactivitycode_id = 2
      ) C
        ON C.claimcontrol_id = O.claimcontrol_id
          AND C.RN = O.RN
       ;;
  }

  dimension: compound_primary_key {
    type: string
    primary_key: yes
    hidden: yes
    sql: CONCAT(${claimcontrol_id},${num}) ;;
  }

  dimension: claimcontrol_id {
    hidden: yes
    type: number
    sql: ${TABLE}.claimcontrol_id ;;
  }

  dimension: num {
    hidden: yes
    type: number
    sql: ${TABLE}.num ;;
  }

  dimension_group: first_open_date {
    label: "First Open"
    type: time
    timeframes: [date,month,year]
    sql: ${TABLE}.opened ;;
  }

  dimension_group: first_close_date {
    label: "First Close"
    type: time
    timeframes: [date,month,year]
    sql: ${TABLE}.closed ;;
  }

  dimension: close_reason {
    label: "First Close Reason"
    type: string
    sql: ${TABLE}.dscr ;;
  }

  dimension: first_days_open {
    label: "First Days Open"
    type: number
    sql: case when ${first_close_date_date} IS NULL
      then DATEDIFF(dd, ${first_open_date_date}, GetDate())
      else DATEDIFF(dd, ${first_open_date_date}, ${first_close_date_date}) end  ;;
  }

  dimension : closed_within {
    type: tier
    label: "First Closed Within (Tiers)"
    tiers: [31,61,91]
    style: integer
    sql: case when ${first_close_date_date} IS NULL
      then NULL
      else ${first_days_open} end ;;
    value_format: "0"
  }

  #SH 2020-04-29 Added data point with more tiers for MCAS reporting 23-28
  dimension : closed_within_more {
    type: tier
    label: "First Closed Within (More Tiers)"
    tiers: [31,61,91,181,366]
    style: integer
    sql: case when ${first_close_date_date} IS NULL
      then NULL
      else ${first_days_open} end ;;
    value_format: "0"
  }

  dimension : days_open_tier {
    type: tier
    label: "First Days Open (Tiers)"
    tiers: [31,61,91]
    style: integer
    sql: ${first_days_open} ;;
    value_format: "0"
  }

  measure: first_open_count {
    hidden: no
    label: "Reported Claims Count"
    type: count
    drill_fields: [claim_stat*]
  }

  measure: first_close_count {
    hidden: no
    label: "First Closed Claims Count"
    type: count
    filters: {
      field: first_close_date_date
      value: "-NULL"
    }
    link: {
      label: "Sort by Claim Number"
      url: "{{ link }}&sorts=claim_control.claim_number"
    }
    link: {
      label: "Sort by Date Closed"
      url: "{{ link }}&sorts=dt_claims_first_activity.first_close_date_date"
    }
    drill_fields: [claim_stat*]
  }

  measure: sum_days_open {
    hidden:yes
    type: sum
    label: "Total Days Open"
    sql:  ${first_days_open}  ;;
    value_format: "0"
  }

  measure: average_days_to_close {
    type: average
    label: "Average Days To First Close"
    sql:  case when ${first_close_date_date} IS NULL
      then NULL
      else ${first_days_open} end  ;;
    value_format: "0"
    drill_fields: [claim_stat*]
  }

  set: claim_stat {
    fields: [
      claim_control.claim_number,
      claim_control_status.dscr,
      claim_loss_type.dscr,
      claim_type.dscr,
      claim_severity.dscr,
      claim_control.loss_date_date,
      claim_control.reported_date_date,
      dt_claim_days_open.days_open,
      dt_claims_first_activity.first_close_date_date,
      dt_claim_close_date.claim_close_date_date,
      dt_claim_inside_adjuster.initials,
      v_claim_detail_feature.sum_indemnity_paid,
      v_claim_detail_feature.sum_indemnity_reserve,
      v_claim_detail_feature.sum_expense_paid

    ]
  }
}
