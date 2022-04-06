view: v_billing_futures {
  sql_table_name: dbo.vBillingFutures ;;

  dimension: compound_primary_key {
    primary_key: yes
    hidden: yes
    sql: CONCAT(${policy_id},${renewal_ver},${billinginstallment_num},${num}) ;;
  }

  dimension: amount_hidden {
    hidden:  yes
    type: string
    sql: ${TABLE}.amount ;;
    value_format: "$0.00"
  }

  dimension: amountspread {
    hidden:  yes
    type: number
    sql: ${TABLE}.amountspread ;;
  }

  dimension: billingchargescreditstype_id {
    type: number
    hidden: yes
    sql: ${TABLE}.billingchargescreditstype_id ;;
  }

  dimension: billingchargetypecategory_dscr {
    label: "Charge Category"
    type: string
    sql: ${TABLE}.billingchargetypecategory_dscr ;;
  }

  dimension: billingchargetypecategory_id {
    type: number
    hidden: yes
    sql: ${TABLE}.billingchargetypecategory_id ;;
  }

  dimension: billingfuturecash_num {
    label: "Order Number"
    type: number
    sql: ${TABLE}.billingfuturecash_num ;;
  }

  dimension: billinginstallment_num {
    label: "Installment Number"
    type: number
    sql: ${TABLE}.billinginstallment_num ;;
  }

  dimension: dscr {
    label: "Description"
    type: string
    sql: ${TABLE}.dscr ;;
  }

  dimension_group: due {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.due_date ;;
  }

  dimension: num {
    label: "Number"
    type: number
    sql: ${TABLE}.num ;;
  }

  dimension: packagepart_num {
    type: number
    hidden: yes
    sql: ${TABLE}.packagepart_num ;;
  }

  dimension: policy_id {
    type: number
    hidden: yes
    # hidden: true
    sql: ${TABLE}.policy_id ;;
  }

  dimension: renewal_ver {
    type: number
    hidden: yes
    sql: ${TABLE}.renewal_ver ;;
  }

  dimension: tax_amount_hidden {
    hidden: yes
    type: number
    sql: ${TABLE}.tax_amount ;;
  }

  dimension: tax_rate {
    type: string
    hidden: yes
    sql: ${TABLE}.tax_rate ;;
  }

  dimension: total {
    type: string
    sql: ${TABLE}.total ;;
  }

  dimension_group: transaction {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.tran_date ;;
  }

  measure: amount {
    type: sum
    value_format_name:  usd
    sql_distinct_key: ${compound_primary_key} ;;
    sql: ${amount_hidden} ;;
  }

  measure: tax_amount {
    type: sum
    value_format_name:  usd
    sql_distinct_key: ${compound_primary_key} ;;
    sql: ${tax_amount_hidden} ;;
  }

  measure: count {
    type: count
    drill_fields: [policy.rewrittenfrom_policy_id]
  }
}
