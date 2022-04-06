view: v_billing_statement {
  sql_table_name: dbo.vBillingStatement ;;

  dimension: adjust_num {
    type: number
    sql: ${TABLE}.adjust_num ;;
  }

  dimension: balance {
    type: string
    sql: ${TABLE}.balance ;;
  }

  dimension: billed {
    type: string
    sql: ${TABLE}.billed ;;
  }

  dimension: billingaccountcash_id {
    type: number
    sql: ${TABLE}.billingaccountcash_id ;;
  }

  dimension: billingaccountinvoice_id {
    type: number
    sql: ${TABLE}.billingaccountinvoice_id ;;
  }

  dimension: billingaccountinvoice_num {
    type: number
    sql: ${TABLE}.billingaccountinvoice_num ;;
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

  dimension: billinggrouping_num {
    type: number
    sql: ${TABLE}.billinggrouping_num ;;
  }

  dimension: billinggroupingreason_id {
    type: number
    sql: ${TABLE}.billinggroupingreason_id ;;
  }

  dimension: billingnotice_num {
    type: number
    sql: ${TABLE}.billingnotice_num ;;
  }

  dimension: billingnoticetype_id {
    type: number
    sql: ${TABLE}.billingnoticetype_id ;;
  }

  dimension: check_num {
    type: string
    sql: ${TABLE}.check_num ;;
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

  dimension: due_date {
    type: string
    sql: ${TABLE}.due_date ;;
  }

  dimension: packagepart_num {
    type: number
    sql: ${TABLE}.packagepart_num ;;
  }

  dimension: paid {
    type: string
    sql: ${TABLE}.paid ;;
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

  dimension: print_description {
    type: string
    sql: ${TABLE}.print_description ;;
  }

  dimension: printprocess_id {
    type: number
    sql: ${TABLE}.printprocess_id ;;
  }

  dimension: renewal_ver {
    type: string
    sql: ${TABLE}.renewal_ver ;;
  }

  dimension: src {
    type: string
    sql: ${TABLE}.src ;;
  }

  dimension: transfer_from_suspenseaccount_id {
    type: number
    sql: ${TABLE}.transfer_from_suspenseaccount_id ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: user {
    type: string
    sql: ${TABLE}."user" ;;
  }

  measure: count {
    type: count
    drill_fields: [policy.rewrittenfrom_policy_id]
  }
}
