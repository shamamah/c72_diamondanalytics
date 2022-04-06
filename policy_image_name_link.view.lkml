view: policy_holder_policy_image_name_link {
  sql_table_name: dbo.PolicyImageNameLink ;;

  dimension: name_id {
    type: number
    hidden: yes
    sql: ${TABLE}.name_id ;;
  }

  dimension: nameaddresssource_id {
    type: number
    hidden: yes
    sql: ${TABLE}.nameaddresssource_id ;;
  }

  dimension: policy_id {
    type: number
    hidden: yes
    sql: ${TABLE}.policy_id ;;
  }

  dimension: policyimage_num {
    hidden: yes
    type: number
    sql: ${TABLE}.policyimage_num ;;
  }
}
