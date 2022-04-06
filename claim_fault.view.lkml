view: claim_fault {
  sql_table_name: dbo.ClaimFault ;;

  dimension: claimfault_id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.claimfault_id ;;
  }

  dimension: dscr {
    label: "Is At-Fault"
    view_label: "Claim"
    type: string
    sql: ${TABLE}.dscr ;;
  }

  dimension: sort_order {
    hidden: yes
    type: number
    sql: ${TABLE}.sort_order ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: []
  }
}
