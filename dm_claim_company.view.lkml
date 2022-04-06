view: dm_claim_company {
  sql_table_name: dbo.ClaimCompany ;;

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

  dimension: company_code {
    label: "Company Code"
    type: string
    sql: ${TABLE}.CompanyCode ;;
  }

  dimension: lob {
    label: "xLOB"
    type: string
    sql: ${TABLE}.LOB ;;
  }

  # dimension: catcode {
  #   hidden: yes
  #   label: "CAT Code"
  #   type: string
  #   sql: ${TABLE}.CATCode ;;
  # }

  dimension: cl_cat_code {
    view_label: "Claim"
    label: "CAT Code"
    type: string
    sql: case when ${TABLE}.ClCATCode IS NULL then ${TABLE}.CATCode else ${TABLE}.ClCATCode end ;;
  }

  dimension: is_cat {
    view_label: "Claim"
    label: "Is CAT"
    type: string
    sql: case when ${TABLE}.ClCATCode = 'noncat' then 'No' else 'Yes' end ;;
  }

  # dimension: adjustment_type {
  #   hidden: yes
  #   label: "Adjustment Type"
  #   type: string
  #   sql: ${TABLE}.AdjustmentType ;;
  # }

  dimension: cl_adjustment_type {
    view_label: "Claim"
    label: "Adjustment Type"
    type: string
    sql: case when ${TABLE}.ClAdjustmentType IS NULL then ${TABLE}.AdjustmentType else ${TABLE}.ClAdjustmentType end  ;;
  }

  dimension: lobcode {
    label: "xLOB Code"
    type: string
    sql: ${TABLE}.LOBCode ;;
  }

  dimension: isocode {
    view_label: "Claim"
    label: "xISO Code"
    type: string
    sql: ${TABLE}.ISOCode ;;
  }

  dimension: cause_code {
    view_label: "Claim"
    label: "xCause Code"
    type: string
    sql: ${TABLE}.CauseCode ;;
  }

#   measure: count {
#     type: count
#     drill_fields: [id]
#   }
}
