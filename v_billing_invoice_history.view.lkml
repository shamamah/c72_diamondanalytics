view: v_billing_invoice_history {
  sql_table_name: dbo.vBillingInvoiceHistory ;;

  dimension_group: added {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.added ;;
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

  dimension: invoice_amount {
    type: string
    sql: ${TABLE}.invoice_amount ;;
  }

  dimension: policy_id {
    type: number
    # hidden: true
    sql: ${TABLE}.policy_id ;;
  }

  dimension: policyimage_num {
    type: number
    sql: ${TABLE}.policyimage_num ;;
  }

  dimension_group: printdate {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.printdate ;;
  }

  dimension: printevent_dscr {
    type: string
    sql: ${TABLE}.printevent_dscr ;;
  }

  dimension: printevent_id {
    type: number
    sql: ${TABLE}.printevent_id ;;
  }

  dimension: printjob_id {
    type: number
    sql: ${TABLE}.printjob_id ;;
  }

  dimension: printjobstatus_dscr {
    type: string
    sql: ${TABLE}.printjobstatus_dscr ;;
  }

  dimension: printjobstatus_id {
    type: number
    sql: ${TABLE}.printjobstatus_id ;;
  }

  dimension: printprocess_id {
    type: number
    sql: ${TABLE}.printprocess_id ;;
  }

  dimension: printrecipient_dscr {
    type: string
    sql: ${TABLE}.printrecipient_dscr ;;
  }

  dimension: prior_outstanding_amount {
    type: string
    sql: ${TABLE}.prior_outstanding_amount ;;
  }

  measure: count {
    type: count
    drill_fields: [policy.rewrittenfrom_policy_id]
  }
}
