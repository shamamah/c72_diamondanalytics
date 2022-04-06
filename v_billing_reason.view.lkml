view: v_billing_reason {
  sql_table_name: dbo.vBillingReason ;;

  dimension: billingadjustment_id {
    type: number
    sql: ${TABLE}.billingadjustment_id ;;
  }

  dimension: billingreason_id {
    type: number
    sql: ${TABLE}.billingreason_id ;;
  }

  dimension: dscr {
    type: string
    sql: ${TABLE}.dscr ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
