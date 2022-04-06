view: policy_underwriting_code {
  sql_table_name: dbo.PolicyUnderwritingCode ;;

  dimension: underwriting_question {
    type: string
    sql: ${TABLE}.dscr ;;
  }

  dimension_group: last_modified {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified_date ;;
  }

  dimension_group: pcadded {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.pcadded_date ;;
  }

  dimension: policyunderwritingcode_id {
    type: number
    sql: ${TABLE}.policyunderwritingcode_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
