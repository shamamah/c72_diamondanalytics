view: claim_severity {
  sql_table_name: dbo.ClaimSeverity ;;

  dimension: claimseverity_id {
    primary_key: yes
    type: number
    hidden: yes
    sql: ${TABLE}.claimseverity_id ;;
  }

  dimension: dscr {
    label: "Severity"
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
