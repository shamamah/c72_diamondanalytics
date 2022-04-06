view: billing_payplan_type {
  sql_table_name: dbo.BillingPayplanType ;;

  dimension: billingpayplantype_id {
    type: number
    hidden: yes
    sql: ${TABLE}.billingpayplantype_id ;;
  }

  dimension: dscr {
    type: string
    label: "Pay Plan"
    sql: ${TABLE}.dscr ;;
  }

  dimension_group: last_modified {
    type: time
    hidden: yes
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified_date ;;
  }

  dimension_group: pcadded {
    type: time
    hidden: yes
    timeframes: [time, date, week, month]
    sql: ${TABLE}.pcadded_date ;;
  }

  measure: count {
    type: count
    hidden: yes
    drill_fields: []
  }
}
