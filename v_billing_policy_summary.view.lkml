view: v_billing_policy_summary {
  sql_table_name: dbo.vBillingPolicySummary ;;

  dimension_group: added {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.added_date ;;
  }

  dimension: balance {
    type: string
    sql: ${TABLE}.balance ;;
  }

  dimension: billed {
    type: string
    sql: ${TABLE}.billed ;;
  }

  dimension: billing_activity_order {
    type: number
    sql: ${TABLE}.BillingActivityOrder ;;
  }

  dimension: billing_charge_credit_num {
    type: number
    sql: ${TABLE}.BillingChargeCredit_num ;;
  }

  dimension: billing_charges_credits_type_id {
    type: number
    sql: ${TABLE}.BillingChargesCreditsType_id ;;
  }

  dimension: billingcash_num {
    type: number
    sql: ${TABLE}.billingcash_num ;;
  }

  dimension: billingcashinsource_id {
    type: number
    sql: ${TABLE}.billingcashinsource_id ;;
  }

  dimension: billingcashtype_id {
    type: number
    sql: ${TABLE}.billingcashtype_id ;;
  }

  dimension: billingchargetypecategory_id {
    type: number
    sql: ${TABLE}.billingchargetypecategory_id ;;
  }

  dimension: billingnoticetype_id {
    type: number
    sql: ${TABLE}.billingnoticetype_id ;;
  }

  dimension_group: date {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.date ;;
  }

  dimension: dscr {
    type: string
    sql: ${TABLE}.dscr ;;
  }

  dimension: paid {
    type: string
    sql: ${TABLE}.PAID ;;
  }

  dimension_group: pcadded {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.pcadded_date ;;
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

  dimension: premium_written {
    type: string
    sql: ${TABLE}.premium_written ;;
  }

  dimension: renewal_ver {
    type: number
    sql: ${TABLE}.Renewal_ver ;;
  }

  dimension: totalpaid {
    type: string
    sql: ${TABLE}.totalpaid ;;
  }

  dimension: user {
    type: string
    sql: ${TABLE}."User" ;;
  }

  dimension: users_id {
    type: number
    # hidden: true
    sql: ${TABLE}.users_id ;;
  }

  measure: count {
    type: count
    drill_fields: [policy.rewrittenfrom_policy_id, users.users_id, users.login_name]
  }
}
