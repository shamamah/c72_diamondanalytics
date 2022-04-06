view: claim_control_status {
  sql_table_name: dbo.ClaimControlStatus ;;

  dimension: claimcontrolstatus_id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.claimcontrolstatus_id ;;
  }

  dimension: dscr {
    label: "Status"
    view_label: "Claim"
    type: string
    sql: ${TABLE}.dscr ;;
  }

  dimension: enabled {
    hidden: yes
    type: string
    sql: ${TABLE}.enabled ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: []
  }
}
