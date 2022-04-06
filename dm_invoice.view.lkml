view: dm_invoice {
  sql_table_name: dbo.Invoice ;;

  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.Id ;;
  }

  dimension: claim_id {
    hidden: yes
    type: number
    sql: ${TABLE}.ClaimID ;;
  }

  dimension: source_system {
    label: "Source System"
    type: string
    sql: ${TABLE}.SourceSystem ;;
  }

  dimension: company_code {
    label: "Company Code"
    type: string
    sql: ${TABLE}.CompanyCode ;;
  }

  dimension: invoice_id {
    label: "Invoice ID"
    hidden: yes
    type: number
    sql: ${TABLE}.InvoiceId ;;
  }

  dimension: invoice_number {
    label: "Number"
    type: string
    sql: ${TABLE}.InvoiceNumber ;;
  }

  dimension_group: invoice {
    label: "Invoice"
    type: time
    timeframes: [date,month,quarter,year]
    sql: ${TABLE}.InvoiceDate ;;
  }

  dimension: invoice_status {
    label: "xStatus"
    type: string
    sql: ${TABLE}.InvoiceStatus ;;
  }

  dimension_group: due {
    label: "Due"
    type: time
    timeframes: [date,month,quarter,year]
    sql: ${TABLE}.DueDate ;;
  }

  dimension_group: received {
    label: "xReceived"
    type: time
    timeframes: [date,month,quarter,year]
    sql: ${TABLE}.ReceivedDate ;;
  }

  dimension_group: void {
    label: "xVoid"
    type: time
    timeframes: [date,month,quarter,year]
    sql: ${TABLE}.VoidDate ;;
  }

  dimension: label {
    label: "Type"
    type: string
    sql: ${TABLE}.Label ;;
  }

  dimension: associated_user_id {
    label: "Associated User ID"
    type: number
    sql: ${TABLE}.AssociatedUserID ;;
  }

  dimension: dim_service_amt {
    hidden: yes
    type: string
    sql: ${TABLE}.ServiceAmt ;;
  }

  measure: service_amt {
    label: "xService Amount"
    type: sum
    sql: ${dim_service_amt} ;;
    value_format_name: usd
  }

  dimension: dim_expense_amount {
    hidden: yes
    type: string
    sql: ${TABLE}.ExpenseAmt ;;
  }

  measure: expense_amount {
    label: "xExpense Amount"
    type: sum
    sql: ${dim_expense_amount} ;;
    value_format_name: usd
  }

  dimension: dim_total_amount {
    hidden: yes
    type: number
    sql: ${TABLE}.Total ;;
  }

  measure: total_amount {
    label: "Total Amount"
    type: sum
    sql: ${dim_total_amount} ;;
    value_format_name: usd
  }

  dimension: dim_tax {
    hidden:yes
    type: string
    sql: ${TABLE}.Tax ;;
  }

  measure: tax_amount {
    label: "Tax Amount"
    type: sum
    sql: ${dim_tax} ;;
    value_format_name: usd
  }

  dimension_group: _inserted {
    hidden: yes
    type: time
    timeframes: [date,month,quarter,year]
    sql: ${TABLE}._inserted ;;
  }

  dimension: active {
    label: "Is Active"
    type: string
    sql: case when ${TABLE}.Active=1 then 'Yes' else 'No' end ;;
  }

  measure: count {
    type: count
    #drill_fields: [invoice_id]
  }
}
