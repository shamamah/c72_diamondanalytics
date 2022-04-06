view: policy_demo {
  sql_table_name: dbo.Policy ;;
  view_label: "Policy"

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

  dimension_group: legalcancel_date {
    label: "Legal Cancellation"
    type: time
    timeframes: [date]
    sql: ${TABLE}.legalcancel_date ;;
  }

  dimension: current_policy {
    link: {
      label: "Open in Diamond"
      url: "https://demo.diamondasaservice.com/DiamondWeb/Employee/Policy/{{ value }}"
      icon_url: "http://www.insuresoft.com/favicon.ico"
    }
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

  dimension: inforce {
    label: "In-Force"
    type: yesno
    sql: ${TABLE}.policycurrentstatus_id = 1 ;;
  }

  dimension: legalcancelnotice {
    label: "Legal Cancellation Notice"
    type: yesno
    sql: ${TABLE}.legalcancelnotice = 1 ;;
  }

  dimension: cancelled {
    label: "Cancelled"
    type: yesno
    sql: ${TABLE}.cancelled = 1 ;;
  }

  #  - measure: premium_chg_written
  #    label: 'Written Premium Change'
  #    type: sum
  #    value_format_name: usd
  #    sql: ${policy_image.premium_chg_written}

  set: detail_cancel {
    fields: [policy_demo.current_policy, policy_holder_name.display_name, policy_demo.legalcancel_date_date, policy_demo.cancel_date_date, billing_invoice.current_outstanding_amount_sum]      # creates named set customers.detail
  }

  set: detail_count {
    fields: [policy_demo.current_policy, policy_holder_name.display_name, policy_image_active.premium_written_sum]
  }

  measure: count {
    type: count
    drill_fields: [detail_count*]
  }

  measure: pending_count {
    type: count
    filters: {
      field: current_status.description
      value: "Pending"
    }
  }

  measure: legalcancellation_count {
    label: "Legal Cancellation Count"
    type: count
    filters: {
      field: legalcancelnotice
      value: "Yes"
    }
    filters: {
      field: cancelled
      value: "No"
    }
    drill_fields: [detail_cancel*]
  }

  measure: inforce_count {
    type: count
    filters: {
      field: current_status.description
      value: "In-Force"
    }
  }

  measure: percent_of_total_count {
    type: percent_of_total
    sql: ${count} ;;
  }
}
