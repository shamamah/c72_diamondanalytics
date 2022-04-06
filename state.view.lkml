view: state {
  sql_table_name: dbo.State ;;

  dimension: state_id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.state_id ;;
  }

 dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

 dimension: statename {
    label: "State Name"
    type: string
    sql: ${TABLE}.statename ;;
  }

}
