view: v_billing_future_notice {
  sql_table_name: dbo.vBillingFutureNotice ;;

  dimension: billingfuturenotice_num {
    type: number
    sql: ${TABLE}.billingfuturenotice_num ;;
  }

  dimension: billingnoticetype_id {
    type: number
    sql: ${TABLE}.billingnoticetype_id ;;
  }

  dimension: dscr {
    type: string
    sql: ${TABLE}.dscr ;;
  }

  dimension_group: due {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.due_date ;;
  }

  dimension: policy_id {
    type: number
    # hidden: true
    sql: ${TABLE}.policy_id ;;
  }

  measure: count {
    type: count
    drill_fields: [policy.rewrittenfrom_policy_id]
  }
}
