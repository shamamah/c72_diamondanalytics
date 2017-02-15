view: policy {
  sql_table_name: dbo.Policy ;;

  dimension: policy_id {
    hidden: yes
    primary_key: yes
    type: number
    sql: ${TABLE}.policy_id ;;
  }

  dimension: policycurrentstatus_id {
    hidden: yes
    type: string
    sql: ${TABLE}.policycurrentstatus_id ;;
  }

  dimension_group: cancel_date {
    label: "Cancellation"
    type: time
    timeframes: [date]
    sql: ${TABLE}.cancel_date ;;
  }

  dimension: current_policy {
    label: "Number"
    type: string
    sql: ${TABLE}.current_policy ;;
  }

  dimension: activeimage_num {
    label: "Active Image Number"
    type: string
    sql: ${TABLE}.activeimage_num ;;
  }

  dimension_group: first_eff {
    label: "First Effective"
    type: time
    timeframes: [date]
    sql: ${TABLE}.first_eff_date ;;
  }

  dimension_group: firstwritten {
    label: "First Written"
    type: time
    timeframes: [date]
    sql: ${TABLE}.firstwritten_date ;;
  }

  dimension_group: first_exp {
    label: "First Expiration"
    type: time
    timeframes: [date]
    sql: ${TABLE}.first_exp_date ;;
  }

  #  - measure: premium_chg_written
  #    label: 'Written Premium Change'
  #    type: sum
  #    value_format_name: usd
  #    sql: ${policy_image.premium_chg_written}

  measure: count {
    type: count
    drill_fields: [location_address.zip, company_state_lob.commercial_name1, policy.current_policy]
  }

  measure: pending_count {
    type: count
    filters: {
      field: current_status.description
      value: "Pending"
    }
  }

  measure: inforce_count {
    type: count
    filters: {
      field: current_status.description
      value: "In-Force"
    }
  }

  measure: non_archive_cancel_count {
    type: count
    filters: {
      field: current_status.non_archive_cancel_status
      value: "Yes"
    }
  }

  measure: conversion_rate {
    type: number
    value_format_name: percent_2
    sql: (1.0*${inforce_count})/NULLIF((1.0*${non_archive_cancel_count}),0) ;;

  }

  measure: percent_of_total_count {
    type: percent_of_total
    sql: ${count} ;;
  }
}
