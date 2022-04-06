connection: "c72-datamart-test"

# include all the views
include: "dm*.view"

fiscal_month_offset: 0
week_start_day: sunday

explore: dm_claim {
  group_label: "Transcynd Analytics [Test]"
  label: "DataMart [Test]"
  #persist_for: "4 hours"
  view_label: "Claim"

  # access_filter: {
  #   field:company_state_lob.commercial_name1
  #   user_attribute:company_name
  # }

  #Exclude records without claim number
  # sql_always_where: ${claim_number} > ''
  #   AND {% condition dt_claim_transactions_as_of.as_of_date %} claim_control.reported_date {% endcondition %}
  #   ;;

  #Exclude records with status of 'Cancelled'
  sql_always_where: ISNULL(dm_claim.CurrentClaimStatus,'') <> 'Cancelled' ;;

  #join: claim_type {
  #  type: inner
  #  relationship: one_to_many
  #  sql_on: ${claim_type.claimtype_id} = ${claim_control.claim_type_id} ;;
  #}

  join: dm_claim_activity {
    view_label: "Claim Activity"
    type: left_outer
    relationship: one_to_one
    sql_on: ${dm_claim.id} = ${dm_claim_activity.claim_id} ;;
  }

  join: dm_claim_company {
    view_label: "Company"
    type: left_outer
    relationship: one_to_one
    sql_on: ${dm_claim.id} = ${dm_claim_company.claim_id} ;;
  }

  join: dm_claim_coverage {
    view_label: "Coverage"
    type: left_outer
    relationship: one_to_one
    sql_on: ${dm_claim.id} = ${dm_claim_coverage.claim_id} ;;
  }

  join: dm_claim_financial {
    view_label: "Claim Financial"
    type: left_outer
    relationship: one_to_one
    sql_on: ${dm_claim.id} = ${dm_claim_financial.claim_id} ;;
  }

  join: dm_claim_policy {
    view_label: "Policy"
    type: left_outer
    relationship: one_to_one
    sql_on: ${dm_claim.id} = ${dm_claim_policy.claim_id} ;;
  }

  join: dm_claim_policy_holder {
    view_label: "Policy Holder"
    type: left_outer
    relationship: one_to_one
    sql_on: ${dm_claim.id} = ${dm_claim_policy_holder.claim_id} ;;
  }

  join: dm_claim_status {
    view_label: "Claim Status"
    type: left_outer
    relationship: one_to_many
    sql_on: ${dm_claim.id} = ${dm_claim_status.claim_id} ;;
  }

  join: dm_personnel_manager {
    view_label: "Personnel-Account Manager"
    type: left_outer
    relationship: one_to_one
    sql_on: ${dm_claim.id} = ${dm_personnel_manager.claim_id} ;;
  }

  join: dm_personnel_supervisor {
    view_label: "Personnel-QA"
    type: left_outer
    relationship: one_to_one
    sql_on: ${dm_claim.id} = ${dm_personnel_supervisor.claim_id} ;;
  }

  join: dm_personnel_adjuster {
    view_label: "Personnel-Adjuster"
    type: left_outer
    relationship: one_to_one
    sql_on: ${dm_claim.id} = ${dm_personnel_adjuster.claim_id} ;;
  }

  join: dm_invoice {
    view_label: "Invoice"
    type: left_outer
    relationship: one_to_many
    sql_on: ${dm_claim.id} = ${dm_invoice.claim_id} ;;
  }

  join: dm_claim_re_open {
    view_label: "Claim Re-Open"
    type: left_outer
    relationship: one_to_many
    sql_on: ${dm_claim.internal_claim_id} = ${dm_claim_re_open.internal_claim_id} ;;
  }
}
