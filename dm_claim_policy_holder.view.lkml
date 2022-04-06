view: dm_claim_policy_holder {
  sql_table_name: dbo.ClaimPolicyHolder ;;

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

  dimension: insured_last_name {
    label: "Last Name"
    type: string
    sql: ${TABLE}.InsuredLastName ;;
  }

  dimension: insured_mortgagee {
    label: "Mortgagee"
    type: string
    sql: ${TABLE}.InsuredMortgagee ;;
  }

  dimension: insured_company {
    label: "Company"
    type: string
    sql: ${TABLE}.InsuredCompany ;;
  }

  dimension: loan_number {
    label: "Loan Number"
    type: string
    sql: ${TABLE}.LoanNumber ;;
  }

  dimension: insured_addr1 {
    label: "Address Line 1"
    type: string
    sql: ${TABLE}.ClInsuredAddr1 ;;
  }

  dimension: insured_addr2 {
    label: "Address Line 2"
    type: string
    sql: ${TABLE}.ClInsuredAddr2 ;;
  }

  dimension: insured_city {
    label: "City"
    type: string
    sql: ${TABLE}.ClInsuredCity ;;
  }

  dimension: insured_state {
    label: "State"
    type: string
    sql: ${TABLE}.ClInsuredState ;;
  }

  dimension: insured_zip {
    label: "ZIP"
    type: string
    sql: ${TABLE}.ClInsuredZip ;;
  }

  dimension: insured_country {
    label: "Country"
    type: string
    sql: ${TABLE}.ClInsuredCountry ;;
  }

#   measure: count {
#     type: count
#     drill_fields: [id, insured_last_name]
#   }
}
