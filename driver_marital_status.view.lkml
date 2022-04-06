view: driver_marital_status {
  sql_table_name: dbo.MaritalStatus ;;

  dimension: dscr {
    label: "Marital Status"
    type: string
    sql: ${TABLE}.dscr ;;
  }

  dimension: maritalstatus_id {
    hidden: yes
    type: number
    sql: ${TABLE}.maritalstatus_id ;;
  }
}
