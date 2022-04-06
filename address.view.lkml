view: policy_address {
  sql_table_name: dbo.Address ;;

  dimension: address_id {
    primary_key: yes
    hidden:  yes
    type: number
    sql: ${TABLE}.address_id ;;
  }

  dimension: address_num {
    hidden: yes
    type: number
    sql: ${TABLE}.address_num ;;
  }

  dimension: apt_num {
    label: "Apartment Number"
    type: string
    sql: ${TABLE}.apt_num ;;
  }

  dimension: city {
    label: "City"
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: detailstatuscode_id {
    hidden:  yes
    type: number
    sql: ${TABLE}.detailstatuscode_id ;;
  }

  dimension: display_address {
    label: "Display Address"
    type: string
    sql: ${TABLE}.display_address ;;
  }

  dimension: house_num {
    label: "House Number"
    type: string
    sql: ${TABLE}.house_num ;;
  }

 dimension: nameaddresssource_id {
    hidden:  yes
    type: number
    sql: ${TABLE}.nameaddresssource_id ;;
  }

  dimension: pobox {
    label: "PO Box"
    type: string
    sql: ${TABLE}.pobox ;;
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
    hidden:  yes
    type: number
    sql: ${TABLE}.state_id ;;
  }

  dimension: street_name {
    label: "Street Name"
    type: string
    sql: ${TABLE}.street_name ;;
  }

  dimension: zip {
    label: "Zip Code"
    type: zipcode
    sql: LEFT(${TABLE}.zip,5) ;;
  }

  }
