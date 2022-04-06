view: users_non_cea {
  sql_table_name: dbo.Users ;;

  dimension: users_id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.users_id ;;
  }

  dimension: login_name {
    label: "Transaction User"
    type: string
    sql: ${TABLE}.login_name ;;
  }

  dimension: name_id {
    type: number
    hidden: yes
    sql: ${TABLE}.name_id ;;
  }

}
