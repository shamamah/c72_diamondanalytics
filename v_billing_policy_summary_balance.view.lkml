view: v_billing_policy_summary_balance {
  sql_table_name: dbo.vBillingPolicySummaryBalance ;;

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

  dimension: billingactivityorder {
    type: number
    sql: ${TABLE}.billingactivityorder ;;
  }

  dimension: billingcash_num {
    type: number
    sql: ${TABLE}.billingcash_num ;;
  }

  dimension: billingcashtype_id {
    type: number
    sql: ${TABLE}.billingcashtype_id ;;
  }

  dimension: billingchargecredit_num {
    type: number
    sql: ${TABLE}.billingchargecredit_num ;;
  }

  dimension: billingchargescreditstype_id {
    type: number
    sql: ${TABLE}.billingchargescreditstype_id ;;
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
    sql: ${TABLE}.paid ;;
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
    sql: ${TABLE}.renewal_ver ;;
  }

  dimension: totalpaid {
    type: string
    sql: ${TABLE}.totalpaid ;;
  }

  dimension: user {
    type: string
    sql: ${TABLE}."user" ;;
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
