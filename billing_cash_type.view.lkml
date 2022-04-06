view: billing_cash_type {
  sql_table_name: dbo.BillingCashType ;;

  dimension: billingcashtype_id {
    type: number
    hidden: yes
    sql: ${TABLE}.billingcashtype_id ;;
  }

  dimension: dscr {
    type: string
    label: "Trans Type"
    sql: ${TABLE}.dscr ;;
  }

  dimension: iscashin {
    type: string
    hidden: yes
    sql: ${TABLE}.iscashin ;;
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

  dimension: print_description {
    hidden: yes
    type: string
    sql: ${TABLE}.print_description ;;
  }

  dimension: useadjustmentrules {
    type: string
    hidden: yes
    sql: ${TABLE}.useadjustmentrules ;;
  }

  measure: count {
    type: count
    hidden: yes
    drill_fields: []
  }
}
