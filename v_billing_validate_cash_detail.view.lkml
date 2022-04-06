view: v_billing_validate_cash_detail {
  sql_table_name: dbo.vBillingValidateCashDetail ;;

  dimension: billingcashdetailtype_id {
    type: number
    sql: ${TABLE}.billingcashdetailtype_id ;;
  }

  dimension: policy_id {
    type: number
    # hidden: true
    sql: ${TABLE}.policy_id ;;
  }

  dimension: renewal_ver {
    type: number
    sql: ${TABLE}.renewal_ver ;;
  }

  measure: count {
    type: count
    drill_fields: [policy.rewrittenfrom_policy_id]
  }
}
