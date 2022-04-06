view: v_billing_current_information {
  sql_table_name: dbo.vBillingCurrentInformation ;;

  dimension_group: added {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.added_date ;;
  }

  dimension: current_outstanding_amount {
    type: string
    sql: ${TABLE}.current_outstanding_amount ;;
  }

  dimension_group: due {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.due_date ;;
  }

  dimension: paid_in_full {
    type: string
    sql: ${TABLE}.paid_in_full ;;
  }

  dimension: policy_id {
    type: number
    # hidden: true
    sql: ${TABLE}.policy_id ;;
  }

  dimension: premium_written {
    type: string
    sql: ${TABLE}.premium_written ;;
  }

  dimension: renewal_ver {
    type: number
    sql: ${TABLE}.renewal_ver ;;
  }

  dimension: totalcash {
    type: string
    sql: ${TABLE}.totalcash ;;
  }

  measure: count {
    type: count
    drill_fields: [policy.rewrittenfrom_policy_id]
  }
}
