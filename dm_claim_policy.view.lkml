view: dm_claim_policy {
  sql_table_name: dbo.ClaimPolicy ;;

  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.Id ;;
  }

  dimension: claim_id {
    hidden: yes
    type: number
    sql: ${TABLE}.ClaimId ;;
  }

  dimension: client_company_id {
    view_label: "Client"
    label: "Company ID"
    type: number
    sql: ${TABLE}.ClientCompanyID ;;
  }

  dimension: client_company_name {
    view_label: "Client"
    label: "Name"
    type: string
    sql: ${TABLE}.ClientCompanyName ;;
  }

  dimension: branch_id {
    view_label: "Client"
    label: "Branch ID"
    type: number
    sql: ${TABLE}.BranchID ;;
  }

  dimension: client_contact_id {
    view_label: "Client"
    label: "Contact ID"
    type: number
    sql: ${TABLE}.ClientContactID ;;
  }

  dimension: client_contact_name {
    view_label: "Client"
    label: "Contact"
    type: string
    sql: ${TABLE}.ClientContactName ;;
  }

  dimension: client_company_bdx {
    view_label: "Client"
    label: "xBDX"
    type: string
    sql: ${TABLE}.ClientCompanyBDX ;;
  }

  dimension: policy_number {
    label: "Number"
    type: string
    sql: ${TABLE}.PolicyNumber ;;
  }

  dimension: policy_type {
    label: "Type"
    type: string
    sql: ${TABLE}.PolicyType ;;
  }

  dimension_group: policy_effective {
    label: "Effective Date"
    type: time
    timeframes: [date]
    sql: ${TABLE}.PolicyEffectiveDate ;;
  }

  dimension_group: policy_expiration {
    label: "Expiration Date"
    type: time
    timeframes: [date]
    sql: ${TABLE}.PolicyExpirationDate ;;
  }

#   measure: count {
#     type: count
#     drill_fields: [id, client_company_name, client_contact_name]
#   }
}
