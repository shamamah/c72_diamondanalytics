view: billing_invoice {
  sql_table_name: dbo.BillingInvoice ;;

  dimension: current_outstanding_amount {
    hidden: yes
    type: number
    value_format_name: usd
    sql: ${TABLE}.current_outstanding_amount ;;
  }

  dimension_group: due {
    type: time
    timeframes: [
      date,
      week,
      month,
      year
    ]
    sql: ${TABLE}.due_date ;;
  }


  dimension: policy_id {
    primary_key: yes
    type: number
    hidden: yes
    sql: ${TABLE}.policy_id ;;
  }

  set: detail {
    fields: [policy.current_policy, policy_holder_name.display_name, policy.legalcancel_date_date, policy.cancel_date_date, current_outstanding_amount_sum]      # creates named set customers.detail
  }

  measure: current_outstanding_amount_sum {
    label: "Current Outstanding Amount"
    type: sum
    value_format_name: usd
    sql: ${current_outstanding_amount} ;;
    drill_fields: [detail*]
  }

}
