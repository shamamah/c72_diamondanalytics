view: v_billing_account_detail {
  sql_table_name: dbo.vBillingAccountDetail ;;

  dimension: account_num {
    label: "Account Number"
    type: number
    sql: ${TABLE}.account_num ;;
  }

  dimension: agency_id {
    type: number
    hidden: yes
    sql: ${TABLE}.agency_id ;;
  }

  dimension: billingaccount_id {
    type: number
    hidden: yes
    sql: ${TABLE}.billingaccount_id ;;
  }

  dimension: billingpayplan_dscr {
    hidden: yes
    type: string
    label: "Pay Plan"
    sql: ${TABLE}.billingpayplan_dscr ;;
  }

  dimension: billingpayplantype_id {
    type: number
    hidden: yes
    sql: ${TABLE}.billingpayplantype_id ;;
  }

  dimension: billmethod_id {
    type: number
    hidden: yes
    sql: ${TABLE}.billmethod_id ;;
  }

  dimension: billto_id {
    type: number
    hidden: yes
    sql: ${TABLE}.billto_id ;;
  }

  dimension: cancelled {
    type: string
    hidden: yes
    sql: ${TABLE}.cancelled ;;
  }

  dimension: client_id {
    type: number
    hidden: yes
    sql: ${TABLE}.client_id ;;
  }

  dimension: current_policy {
    type: string
    hidden: yes
    sql: ${TABLE}.current_policy ;;
  }

  dimension_group: first_eff {
    type: time
    hidden: yes
    timeframes: [time, date, week, month]
    sql: ${TABLE}.first_eff_date ;;
  }

  dimension: locked {
    type: string
    hidden: yes
    sql: ${TABLE}.locked ;;
  }

  dimension: paymenttype_id {
    type: number
    hidden: yes
    sql: ${TABLE}.paymenttype_id ;;
  }

  dimension: policy_id {
    type: number
     hidden: yes
    sql: ${TABLE}.policy_id ;;
  }

  dimension: policycurrentstatus_dscr {
    type: string
    hidden: yes
    sql: ${TABLE}.policycurrentstatus_dscr ;;
  }

  dimension: policycurrentstatus_id {
    type: number
    hidden: yes
    sql: ${TABLE}.policycurrentstatus_id ;;
  }

  dimension: policyimage_num {
    type: number
    hidden: yes
    sql: ${TABLE}.policyimage_num ;;
  }

  dimension: policystatuscode_id {
    type: number
    hidden: yes
    sql: ${TABLE}.policystatuscode_id ;;
  }

  dimension: rewrittenfrom_policy_id {
    type: number
    hidden: yes
    sql: ${TABLE}.rewrittenfrom_policy_id ;;
  }

  dimension: transtype_id {
    type: number
    hidden: yes
    sql: ${TABLE}.transtype_id ;;
  }

  measure: count {
    type: count
    hidden: yes
    drill_fields: [client.client_id, policy.rewrittenfrom_policy_id, agency.agency_id, agency.accounting_rep_name]
  }
}
