view: v_billing_installment_detail {
  sql_table_name: dbo.vBillingInstallmentDetail ;;

  dimension_group: added {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.added_date ;;
  }

  dimension: addedwith_policyimage_num {
    type: number
    sql: ${TABLE}.addedwith_policyimage_num ;;
  }

  dimension: amount {
    type: string
    sql: ${TABLE}.amount ;;
  }

  dimension: amountspread {
    type: string
    sql: ${TABLE}.amountspread ;;
  }

  dimension: billingchargescreditstype_dscr {
    type: string
    sql: ${TABLE}.billingchargescreditstype_dscr ;;
  }

  dimension: billingchargescreditstype_id {
    type: number
    sql: ${TABLE}.billingchargescreditstype_id ;;
  }

  dimension: billinginstallment_num {
    type: number
    sql: ${TABLE}.billinginstallment_num ;;
  }

  dimension: flatfee {
    type: string
    sql: ${TABLE}.flatfee ;;
  }

  dimension: initinstall {
    type: string
    sql: ${TABLE}.initinstall ;;
  }

  dimension_group: last_modified {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified_date ;;
  }

  dimension: num {
    type: number
    sql: ${TABLE}.num ;;
  }

  dimension: packagepart_num {
    type: number
    sql: ${TABLE}.packagepart_num ;;
  }

  dimension_group: pcadded {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.pcadded_date ;;
  }

  dimension: perinstall {
    type: string
    sql: ${TABLE}.perinstall ;;
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

  dimension: staticfee {
    type: string
    sql: ${TABLE}.staticfee ;;
  }

  measure: count {
    type: count
    drill_fields: [policy.rewrittenfrom_policy_id]
  }
}
