view: location_address {
  sql_table_name: dbo.Address ;;

  dimension: address_id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.address_id ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: county {
    type: string
    sql: ${TABLE}.county ;;
  }

  dimension: display_address {
    type: string
    sql: ${TABLE}.display_address ;;
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

  dimension: state_id {
    hidden: yes
    type: number
    sql: ${TABLE}.state_id ;;
  }

  dimension: zip {
    type: zipcode
    sql: LEFT(${TABLE}.zip,5) ;;
    drill_fields: [location_address.zip, company_state_lob.commercial_name1, policy.current_policy]
  }
}
