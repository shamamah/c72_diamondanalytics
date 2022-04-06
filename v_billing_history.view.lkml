view: v_billing_history {
  sql_table_name: dbo.vBillingHistory ;;

  dimension: balance {
    type: string
    sql: ${TABLE}.balance ;;
  }

  dimension: billed_amount {
    type: string
    sql: ${TABLE}.billed_amount ;;
  }

  dimension: check_num {
    type: string
    sql: ${TABLE}.check_num ;;
  }

  dimension: dscr {
    type: string
    sql: ${TABLE}.dscr ;;
  }

  dimension: login_name {
    type: string
    sql: ${TABLE}.login_name ;;
  }

  dimension: paid_amount {
    type: string
    sql: ${TABLE}.paid_amount ;;
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

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }

  dimension: subtype {
    type: string
    sql: ${TABLE}.subtype ;;
  }

  dimension_group: tran {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.tran_date ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: users_id {
    type: number
    # hidden: true
    sql: ${TABLE}.users_id ;;
  }

  measure: count {
    type: count
    drill_fields: [login_name, policy.rewrittenfrom_policy_id, users.users_id, users.login_name]
  }
}
