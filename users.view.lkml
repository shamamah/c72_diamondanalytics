view: users {
  sql_table_name: dbo.Users ;;

  dimension: users_id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.users_id ;;
  }

  dimension: login_name {
    label: "Username"
    type: string
    sql: ${TABLE}.login_name ;;
  }

  dimension: name_id {
    type: number
    hidden: yes
    sql: ${TABLE}.name_id ;;
  }

  dimension: is_automated {
    type: string
    sql: CASE
        WHEN ${TABLE}.login_name = 'RHAdmin' THEN 'Yes'
        WHEN ${TABLE}.login_name <> 'RHAdmin' THEN 'No'
        ELSE 'No'
      END
       ;;
  }
}
