view: zdt_claim_feature_activity {
  derived_table: {
    sql: SELECT O.claimcontrol_id, O.claimant_num, ROW_NUMBER() OVER (PARTITION BY O.claimcontrol_id, O.claimant_num ORDER BY O.claimfeature_num) AS claimfeature_num, O.added_date AS feature_open_date, C.added_date AS feature_close_date, C.dscr as feature_close_reason
      FROM
      (
        SELECT claimcontrol_id, claimant_num, claimfeature_num, added_date, ROW_NUMBER() OVER (PARTITION BY claimcontrol_id, claimant_num ORDER BY claimfeature_num) AS RN
        FROM dbo.ClaimFeatureActivity
        WHERE claimactivitycode_id = 1
          --AND {% condition dt_claim_transactions_as_of.as_of_date %} added_date {% endcondition %}
      ) O
      LEFT OUTER JOIN
      (
        SELECT claimcontrol_id, claimant_num, claimfeature_num, added_date, dscr, ROW_NUMBER() OVER (PARTITION BY claimcontrol_id, claimant_num ORDER BY claimfeature_num) AS RN
        FROM dbo.ClaimFeatureActivity
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
    sql: CONCAT(${claimcontrol_id},${claimant_num},${claimfeature_num}) ;;
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

  dimension_group: feature_open_date {
    label: "Feature Open"
    type: time
    timeframes: [date]
    sql: ${TABLE}.feature_open_date ;;
  }

  dimension_group: feature_close_date {
    label: "Feature Close"
    type: time
    timeframes: [date]
    sql: ${TABLE}.feature_close_date ;;
  }

  dimension: feature_close_reason {
    hidden: yes
    type: string
    sql: ${TABLE}.feature_close_reason ;;
  }

}
