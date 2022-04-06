view: location_address_link {
  sql_table_name: dbo.LocationAddressLink ;;

  dimension: address_id {
    hidden: yes
    type: number
    sql: ${TABLE}.address_id ;;
  }

  dimension: location_num {
    hidden: yes
    type: number
    sql: ${TABLE}.location_num ;;
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
