view: driver_dln_state {
  sql_table_name: dbo.State ;;

  dimension: state_id {
    hidden: yes
    primary_key: yes
    type: number
    sql: ${TABLE}.state_id ;;
  }

  dimension: state {
    label: "Drivers License State"
    type: string
    sql: ${TABLE}.state ;;
  }
}
