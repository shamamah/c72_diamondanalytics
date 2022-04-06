view: policy_image_address_link {
  sql_table_name: dbo.PolicyImageAddressLink ;;

  dimension: address_id {
    hidden: yes
    type: number
    # hidden: yes
    sql: ${TABLE}.address_id ;;
  }

  dimension: nameaddresssource_id {
    hidden: yes
    type: number
    sql: ${TABLE}.nameaddresssource_id ;;
  }

  dimension: policy_id {
    hidden: yes
    type: number
    sql: ${TABLE}.policy_id ;;
  }

  dimension: policyimage_num {
    hidden: yes
    type: number
    sql: ${TABLE}.policyimage_num ;;
  }

}
