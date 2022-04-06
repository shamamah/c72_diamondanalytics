view: territory {
  sql_table_name: dbo.Territory ;;

  dimension: territory_id {
    hidden: yes
    primary_key: yes
    type: number
    sql: ${TABLE}.territory_id ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: county {
    type: string
    sql: ${TABLE}.county ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: territory_num {
    type: number
    sql: ${TABLE}.territory_num ;;
  }

  dimension: zip {
    type: string
    sql: ${TABLE}.zip ;;
  }
}
