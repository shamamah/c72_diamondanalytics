view: policy_image_active {
  label: "Policy"
  sql_table_name: dbo.PolicyImage ;;

  dimension: compound_primary_key {
    hidden: yes
    primary_key: yes
    sql: CONCAT(${policy_id}, '  ', ${policyimage_num}) ;;
  }

  dimension: policy {
    hidden: yes
    type: string
    sql: ${TABLE}.policy ;;
  }

  dimension: policy_id {
    hidden: yes
    type: number
    sql: ${TABLE}.policy_id ;;
  }

  dimension: policyimage_num {
    hidden:  yes
    type: string
    sql: ${TABLE}.policyimage_num ;;
  }

  dimension: premium_written {
    hidden: yes
    type: number
    value_format_name: usd
    sql: ${TABLE}.premium_written ;;
  }

  dimension: premium_fullterm {
    hidden: yes
    type: number
    value_format_name: usd
    sql: ${TABLE}.premium_fullterm ;;
  }

  measure: premium_written_sum {
    #hidden: true
    label: "Written Premium"
    type: sum_distinct
    value_format_name: usd
    sql_distinct_key: ${compound_primary_key} ;;
    sql: ${premium_written} ;;
  }

  measure: premium_fullterm_sum {
    #hidden: true
    label: "Fullterm Premium"
    type: sum_distinct
    value_format_name: usd
    sql_distinct_key: ${compound_primary_key} ;;
    sql: ${premium_fullterm} ;;
  }

}
