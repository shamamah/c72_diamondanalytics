view: name_address_source {
  sql_table_name: dbo.NameAddressSource ;;

  dimension: dscr {
    hidden: yes
    type: string
    sql: ${TABLE}.dscr ;;
  }

  dimension: nameaddresssource_id {
    hidden: yes
    type: number
    sql: ${TABLE}.nameaddresssource_id ;;
  }

}
