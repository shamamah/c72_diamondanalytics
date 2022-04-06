view: billing_reason {
  sql_table_name: dbo.BillingReason ;;

  dimension: billingadjustment_id {
    type: number
    hidden: yes
    sql: ${TABLE}.billingadjustment_id ;;
  }

  dimension: billingreason_id {
    type: number
    hidden: yes
    sql: ${TABLE}.billingreason_id ;;
  }

  dimension: dscr {
    type: string
    label: "Reason"
    sql: ${TABLE}.dscr ;;
  }

  dimension_group: last_modified {
    type: time
    timeframes: [time, date, week, month]
    hidden: yes
    sql: ${TABLE}.last_modified_date ;;
  }

  dimension_group: pcadded {
    type: time
    timeframes: [time, date, week, month]
    hidden: yes
    sql: ${TABLE}.pcadded_date ;;
  }

  dimension: status {
    type: string
    hidden: yes
    sql: ${TABLE}.status ;;
  }

  measure: count {
    type: count
    hidden: yes
    drill_fields: []
  }
}
