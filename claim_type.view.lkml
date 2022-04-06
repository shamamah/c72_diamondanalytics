view: claim_type {
  sql_table_name: dbo.ClaimType ;;

  dimension: claimtype_id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.claimtype_id ;;
  }

  dimension: dscr {
    label: "Type"
    view_label: "Claim"
    type: string
    sql: ${TABLE}.dscr ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: []
  }
}
