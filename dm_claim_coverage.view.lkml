view: dm_claim_coverage {
  sql_table_name: dbo.ClaimCoverage ;;

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

  dimension: coverage_a {
    hidden: yes
    label: "Coverage A Limit"
    type: number
    sql: ${TABLE}.CoverageA ;;
  }

  measure: coverage_a_exposure {
    label: "Exposure, Cov A"
    type: sum
    sql: ${coverage_a} ;;
    value_format_name: usd
  }

  dimension: coverage_b {
    hidden: yes
    label: "Coverage B Limit"
    type: number
    sql: ${TABLE}.CoverageB ;;
  }

  measure: coverage_b_exposure {
    label: "Exposure, Cov B"
    type: sum
    sql: ${coverage_b} ;;
    value_format_name: usd
  }

  dimension: coverage_c {
    hidden: yes
    label: "Coverage C Limit"
    type: number
    sql: ${TABLE}.CoverageC ;;
  }

  measure: coverage_c_exposure {
    label: "Exposure, Cov C"
    type: sum
    sql: ${coverage_c} ;;
    value_format_name: usd
  }

  dimension: coverage_d {
    hidden: yes
    label: "Coverage D Limit"
    type: number
    sql: ${TABLE}.CoverageD ;;
  }

  measure: coverage_d_exposure {
    label: "Exposure, Cov D"
    type: sum
    sql: ${coverage_d} ;;
    value_format_name: usd
  }

  dimension: coverage_e {
    hidden: yes
    label: "Coverage E Limit"
    type: number
    sql: ${TABLE}.CoverageE ;;
  }

  measure: coverage_e_exposure {
    label: "Exposure, Cov E"
    type: sum
    sql: ${coverage_e} ;;
    value_format_name: usd
  }

  dimension: coverage_f {
    hidden: yes
    label: "Coverage F Limit"
    type: number
    sql: ${TABLE}.CoverageF ;;
  }

  measure: coverage_f_exposure {
    label: "Exposure, Cov F"
    type: sum
    sql: ${coverage_f} ;;
    value_format_name: usd
  }

  dimension: deductible {
    label: "Deductible"
    type: number
    sql: ${TABLE}.Deductible ;;
  }

  dimension: wind_deductible {
    label: "Deductible, Wind"
    type: number
    sql: ${TABLE}.WindDeductible ;;
    value_format_name: usd
  }

  dimension: dim_premium {
    hidden: yes
    type: number
    sql: ${TABLE}.Premium ;;
  }

  measure: premium {
    label: "xPremium"
    type: sum
    sql: ${dim_premium} ;;
    value_format_name: usd
  }

  dimension: occurrence_limit {
    label: "xOccurrence Limit"
    type: number
    sql: ${TABLE}.OccurrenceLimit ;;
    value_format_name: usd
  }

  dimension: dim_total_insured_value {
    hidden: yes
    type: number
    sql: ${TABLE}.TotalInsuredValue ;;
  }

  measure:  total_insured_value {
    label: "xTotal Insured Value"
    type: sum
    sql: ${dim_total_insured_value} ;;
    value_format_name: usd
  }

  dimension: medicare_bodily_injury {
    label: "xIs Medicare BI"
    type: string
    sql: ${TABLE}.MedicareBodilyInjury ;;
  }

  dimension: medicare_eligible {
    label: "xIs Medicare Eligible"
    type: string
    sql: ${TABLE}.MedicareEligible ;;
  }

  dimension: medicare_hicn {
    label: "xMedicare HICN"
    type: string
    sql: ${TABLE}.MedicareHICN ;;
  }

  dimension: medicare_request {
    label: "xIs Medicare Requested"
    type: string
    sql: ${TABLE}.MedicareRequest ;;
  }

  dimension_group: medicare_request_date {
    label: "xMedical Request"
    type: time
    timeframes: [date]
    sql: ${TABLE}.MedicareRequestDate ;;
  }

  dimension: medicare_refused {
    label: "xIs Medicare Refused"
    type: string
    sql: ${TABLE}.MedicareRefused ;;
  }

  #measure: count {
  #  type: count
  #  drill_fields: [id]
  #}
}
