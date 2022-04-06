view: v_billing_cash {
  sql_table_name: dbo.vBillingCash ;;

  dimension: accountingbatch_id {
    type: number
    hidden: yes
    sql: ${TABLE}.accountingbatch_id ;;
  }

  dimension: accountingsuspendedcash_id {
    type: number
    hidden: yes
    sql: ${TABLE}.accountingsuspendedcash_id ;;
  }

  dimension_group: added {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.added_date ;;
  }

  dimension: address_id {
    type: number
    hidden: yes
    sql: ${TABLE}.address_id ;;
  }

  dimension: adjust_num {
    type: number
    sql: ${TABLE}.adjust_num ;;
  }

  dimension: amount_hidden {
    hidden: yes
    type: string
    sql: (${TABLE}.amount * -1) ;;
  }

  dimension: approval_code {
    type: string
    hidden: yes
    sql: ${TABLE}.approval_code ;;
  }

  dimension: authresponse_code {
    type: string
    hidden: yes
    sql: ${TABLE}.authresponse_code ;;
  }

  dimension: authresponse_msg {
    type: string
    hidden: yes
    sql: ${TABLE}.authresponse_msg ;;
  }

  dimension: billingaccount_payment {
    label: "Account Payment"
    type: string
    sql: ${TABLE}.billingaccount_payment ;;
  }

  dimension: billingaccountcash_id {
    type: number
    hidden: yes
    sql: ${TABLE}.billingaccountcash_id ;;
  }

  dimension: billingaccountinvoice_id {
    type: number
    hidden: yes
    sql: ${TABLE}.billingaccountinvoice_id ;;
  }

  dimension: billingaccountinvoice_num {
    label: "Account Invoice Number"
    type: number
    sql: ${TABLE}.billingaccountinvoice_num ;;
  }

  dimension: billingactivityorder {
    label: "Activity Order"
    type: number
    sql: ${TABLE}.billingactivityorder ;;
  }

  dimension: billingcash_id {
    type: number
    hidden: yes
    sql: ${TABLE}.billingcash_id ;;
  }

  dimension: billingcash_num {
    label: "Number"
    type: number
    sql: ${TABLE}.billingcash_num ;;
  }

  dimension: billingcashinsource_id {
    type: number
    hidden: yes
    sql: ${TABLE}.billingcashinsource_id ;;
  }

  dimension: billingcashtype_id {
    type: number
    hidden: yes
    sql: ${TABLE}.billingcashtype_id ;;
  }

  dimension: billinglocation_id {
    type: number
    hidden: yes
    sql: ${TABLE}.billinglocation_id ;;
  }

  dimension: billingreason_id {
    type: number
    hidden: yes
    sql: ${TABLE}.billingreason_id ;;
  }

  dimension_group: check {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.check_date ;;
  }

  dimension: check_num {
    type: string
    sql: ${TABLE}.check_num ;;
  }

  dimension: checkitem_id {
    type: number
    hidden: yes
    sql: ${TABLE}.checkitem_id ;;
  }

  dimension: checkpayeetype_id {
    type: number
    hidden: yes
    sql: ${TABLE}.checkpayeetype_id ;;
  }

  dimension: creditcardaccount_num {
    type: string
    hidden: yes
    sql: ${TABLE}.creditcardaccount_num ;;
  }

  dimension: creditcardtype_id {
    type: number
    hidden: yes
    sql: ${TABLE}.creditcardtype_id ;;
  }

  dimension: expiration_date {
    type: string
    hidden: yes
    sql: ${TABLE}.expiration_date ;;
  }

  dimension_group: export {
    type: time
    timeframes: [time, date, week, month]
    hidden: yes
    sql: ${TABLE}.export_date ;;
  }

  dimension: exportstatus_id {
    type: number
    hidden: yes
    sql: ${TABLE}.exportstatus_id ;;
  }

  dimension: login_name {
    type: string
    hidden: yes
    sql: ${TABLE}.login_name ;;
  }

  dimension: mail_to_address {
    label: "Mail To - Address"
    type: string
    sql: ${TABLE}.mail_to_address ;;
  }

  dimension: mail_to_name1 {
    label: "Mail To - Name 1"
    type: string
    sql: ${TABLE}.mail_to_name1 ;;
  }

  dimension: mail_to_name2 {
    label: "Mail To - Name 2"
    type: string
    sql: ${TABLE}.mail_to_name2 ;;
  }

  dimension: mail_to_type_id {
    type: number
    hidden: yes
    sql: ${TABLE}.mail_to_type_id ;;
  }

  dimension: name_id {
    type: number
    hidden: yes
    sql: ${TABLE}.name_id ;;
  }

  dimension: pay_to {
    type: string
    sql: ${TABLE}.pay_to ;;
  }

  dimension: paylinxtype_id {
    type: number
    hidden: yes
    sql: ${TABLE}.paylinxtype_id ;;
  }

  dimension: paymentprocessor_id {
    type: number
    hidden: yes
    sql: ${TABLE}.paymentprocessor_id ;;
  }

  dimension_group: pcadded {
    type: time
    hidden: yes
    timeframes: [time, date, week, month]
    sql: ${TABLE}.pcadded_date ;;
  }

  dimension: peoplesoftstatus_dscr {
    type: string
    hidden: yes
    sql: ${TABLE}.peoplesoftstatus_dscr ;;
  }

  dimension: peoplesoftstatus_id {
    type: number
    hidden: yes
    sql: ${TABLE}.peoplesoftstatus_id ;;
  }

  dimension: policy_id {
    type: number
    hidden: yes
    sql: ${TABLE}.policy_id ;;
  }

  dimension: compound_primary_key {
    type: string
    primary_key: yes
    hidden: yes
    sql: CONCAT(${policy_id},${billingcash_num},${billingactivityorder}) ;;
  }

  dimension: printprocess_id {
    type: number
    hidden: yes
    sql: ${TABLE}.printprocess_id ;;
  }

  dimension_group: prior_cancel {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.prior_cancel_date ;;
  }

  dimension_group: prior_legal {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.prior_legal_date ;;
  }

  dimension: sequence_number {
    hidden: yes
    type: string
    sql: ${TABLE}.sequence_number ;;
  }

  dimension: tax_amount_hidden {
    hidden: yes
    type: string
    sql: ${TABLE}.tax_amount ;;
  }

  dimension: tax_version {
    type: number
    hidden: yes
    sql: ${TABLE}.tax_version ;;
  }

  dimension: transfer_from_policy {
    type: string
    sql: ${TABLE}.transfer_from_policy ;;
  }

  dimension: transfer_from_policy_id {
    type: number
    hidden: yes
    sql: ${TABLE}.transfer_from_policy_id ;;
  }

  dimension: transfer_from_suspenseaccount_id {
    type: number
    hidden: yes
    sql: ${TABLE}.transfer_from_suspenseaccount_id ;;
  }

  dimension: transfer_num {
    hidden:  yes
    type: number
    sql: ${TABLE}.transfer_num ;;
  }

  dimension: transfer_to_policy {
    type: string
    sql: ${TABLE}.transfer_to_policy ;;
  }

  dimension: transfer_to_policy_id {
    type: number
    hidden: yes
    sql: ${TABLE}.transfer_to_policy_id ;;
  }

  dimension: unapplied_amount_hidden {
    hidden: yes
    type: string
    sql: (${TABLE}.unapplied_amount * -1) ;;
  }

  dimension: users_id {
    type: number
    hidden: yes
    sql: ${TABLE}.users_id ;;
  }

  measure: unapplied_amount {
    type: sum
    value_format_name: usd
    sql_distinct_key: ${compound_primary_key} ;;
    sql: ${unapplied_amount_hidden} ;;
  }

  measure: amount {
    type: sum
    value_format_name: usd
    sql_distinct_key: ${compound_primary_key} ;;
    sql: ${amount_hidden} ;;
  }

  measure: tax_amount {
    type: sum
    value_format_name: usd
    sql_distinct_key: ${compound_primary_key} ;;
    sql: ${tax_amount_hidden} ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [login_name, policy.rewrittenfrom_policy_id, users.users_id, users.login_name, name.name_id, name.display_name, name.sort_name, name.prefix_name, name.first_name, name.middle_name, name.last_name, name.suffix_name, address.address_id, address.street_name, address.ocean_name, address.bay_name, address.waterway_name, address.river_name, address.ocean_local_name, address.bay_local_name, address.waterway_local_name, address.river_local_name, address.waterbody_name, address.waterbody_local_name]
  }
}
