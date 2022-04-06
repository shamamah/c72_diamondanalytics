view: v_billing_future_notice_xml {
  sql_table_name: dbo.vBillingFutureNoticeXML ;;

  dimension_group: added {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.added_date ;;
  }

  dimension: billingfuturenotice_num {
    type: number
    sql: ${TABLE}.billingfuturenotice_num ;;
  }

  dimension: billingnoticetype_dscr {
    type: string
    sql: ${TABLE}.billingnoticetype_dscr ;;
  }

  dimension: billingnoticetype_id {
    type: number
    sql: ${TABLE}.billingnoticetype_id ;;
  }

  dimension_group: due {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.due_date ;;
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

  measure: count {
    type: count
    drill_fields: [policy.rewrittenfrom_policy_id]
  }
}
