view: v_billing_cash_detail {
  sql_table_name: dbo.vBillingCashDetail ;;

  dimension: compound_primary_key {
    primary_key: yes
    hidden: yes
    sql: CONCAT(${policy_id},${billingcash_num},${billingcashdetail_num}) ;;
  }

  dimension_group: added {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.added_date ;;
  }

  dimension: amount_hidden {
    hidden: yes
    type: string
    sql: (${TABLE}.amount * -1) ;;
  }

  dimension: billingaccount_payment {
    type: string
    hidden: yes
    sql: ${TABLE}.billingaccount_payment ;;
  }

  dimension: billingaccountcash_id {
    type: number
    hidden: yes
    sql: ${TABLE}.billingaccountcash_id ;;
  }

  dimension: billingactivityorder {
    label: "Activity Order"
    type: number
    sql: ${TABLE}.billingactivityorder ;;
  }

  dimension: billingcash_num {
    label: "Number"
    type: number
    sql: ${TABLE}.billingcash_num ;;
  }

  dimension: billingcashdetail_num {
    label: "Detail Number"
    type: number
    sql: ${TABLE}.billingcashdetail_num ;;
  }

  dimension: billingcashdetailtype_id {
    type: number
    hidden: yes
    sql: ${TABLE}.billingcashdetailtype_id ;;
  }

  dimension: billingcashinsource_id {
    type: number
    hidden: yes
    sql: ${TABLE}.billingcashinsource_id ;;
  }

  dimension: cashin_dscr {
    type: string
    label: "Cash Type"
    sql: ${TABLE}.cashin_dscr ;;
  }

  dimension: dscr {
    type: string
    label: "Applied To"
    sql: ${TABLE}.dscr ;;
  }

  dimension: policy_id {
    type: number
    hidden: yes
    sql: ${TABLE}.policy_id ;;
  }

  dimension: renewal_ver {
    type: number
    hidden: yes
    sql: ${TABLE}.renewal_ver ;;
  }

  set: detail {
    fields: [policy.current_policy, policy_holder_name.display_name, pv_billing_cash_detail.amount, v_billing_cash_detail.added_date]
  }

  measure: amount {
    type: sum
    value_format_name: usd
    drill_fields: [detail*]
    sql_distinct_key: ${compound_primary_key} ;;
    sql: ${amount_hidden} ;;
  }

  measure: count {
    type: count
    drill_fields: [policy.rewrittenfrom_policy_id]
  }
}
