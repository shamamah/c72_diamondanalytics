view: version {
  sql_table_name: dbo.vVersion ;;

  dimension: companystatelob_id {
    hidden: yes
    type: number
    sql: ${TABLE}.companystatelob_id ;;
  }

  dimension: version_id {
    hidden: yes
    type: number
    sql: ${TABLE}.version_id ;;
  }
}
