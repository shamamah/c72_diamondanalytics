view: v_billing_mchg_detail {
  sql_table_name: dbo.vBillingMChgDetail ;;

  dimension_group: added {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.added_date ;;
  }

  dimension: amount {
    type: string
    sql: ${TABLE}.amount ;;
  }

  dimension: billingactivityorder {
    type: number
    sql: ${TABLE}.billingactivityorder ;;
  }

  dimension: billingcash_num {
    type: number
    sql: ${TABLE}.billingcash_num ;;
  }

  dimension: billingcashdetail_num {
    type: number
    sql: ${TABLE}.billingcashdetail_num ;;
  }

  dimension: billingchargecredit_num {
    type: number
    sql: ${TABLE}.billingchargecredit_num ;;
  }

  dimension: billingchargescreditstype_id {
    type: number
    sql: ${TABLE}.billingchargescreditstype_id ;;
  }

  dimension_group: cashadded {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.cashadded_date ;;
  }

  dimension: cashdscr {
    type: string
    sql: ${TABLE}.cashdscr ;;
  }

  dimension: dscr {
    type: string
    sql: ${TABLE}.dscr ;;
  }

  dimension: packagepart_num {
    type: number
    sql: ${TABLE}.packagepart_num ;;
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
