view: v_billing_future_cash {
  sql_table_name: dbo.vBillingFutureCash ;;

  dimension: accountingbatch_id {
    type: number
    sql: ${TABLE}.accountingbatch_id ;;
  }

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

  dimension: billingcashinsource_dscr {
    type: string
    sql: ${TABLE}.billingcashinsource_dscr ;;
  }

  dimension: billingcashinsource_id {
    type: number
    sql: ${TABLE}.billingcashinsource_id ;;
  }

  dimension: billingcashtype_dscr {
    type: string
    sql: ${TABLE}.billingcashtype_dscr ;;
  }

  dimension: billingcashtype_id {
    type: number
    sql: ${TABLE}.billingcashtype_id ;;
  }

  dimension: billingfuturecash_num {
    type: number
    sql: ${TABLE}.billingfuturecash_num ;;
  }

  dimension_group: check {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.check_date ;;
  }

  dimension: check_num {
    type: string
    sql: ${TABLE}.check_num ;;
  }

  dimension_group: last_modified {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified_date ;;
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

  dimension: printprocess_id {
    type: number
    sql: ${TABLE}.printprocess_id ;;
  }

  dimension: statuscode_id {
    type: number
    sql: ${TABLE}.statuscode_id ;;
  }

  dimension: transfer_from_policy {
    type: string
    sql: ${TABLE}.transfer_from_policy ;;
  }

  dimension: unapplied_amount {
    type: string
    sql: ${TABLE}.unapplied_amount ;;
  }

  dimension: users_id {
    type: number
    # hidden: true
    sql: ${TABLE}.users_id ;;
  }

  dimension: users_name {
    type: string
    sql: ${TABLE}.users_name ;;
  }

  measure: count {
    type: count
    drill_fields: [users_name, policy.rewrittenfrom_policy_id, users.users_id, users.login_name]
  }
}
