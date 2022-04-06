view: dm_claim_financial {
  sql_table_name: dbo.ClaimFinancial ;;

  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.Id ;;
    value_format_name: usd
  }

  dimension: claim_id {
    hidden: yes
    type: number
    sql: ${TABLE}.ClaimId ;;
  }

  dimension: dim_claim_rcv {
    hidden: yes
    type: number
    sql: ${TABLE}.ClaimRCV ;;
  }

  measure:  claim_rcv {
    label: "RCV"
    type: sum
    sql: ${dim_claim_rcv} ;;
    value_format_name: usd
  }

  measure: ave_claim_rcv {
    label: "Average RCV"
    type: average
    sql: ${dim_claim_rcv} ;;
    value_format_name: usd
    filters: {
      field: dim_claim_rcv
      value: ">0.00"
    }
  }

  dimension: dim_claim_acv {
    hidden: yes
    type: number
    sql: ${TABLE}.ClaimACV ;;
  }

  measure:  claim_acv {
    label: "ACV"
    type: sum
    sql: ${dim_claim_acv} ;;
    value_format_name: usd
  }

  measure: ave_claim_acv {
    label: "Average ACV"
    type: average
    sql: ${dim_claim_acv} ;;
    value_format_name: usd
    filters: {
      field: dim_claim_acv
      value: ">0.00"
    }
  }

  dimension: dim_claim_amount {
    hidden: yes
    type: number
    sql: ${TABLE}.ClaimAmount ;;
  }

  measure: claim_amount {
    label: "xClaim Amount"
    type: sum
    sql: ${dim_claim_amount} ;;
    value_format_name: usd
  }

  measure: ave_claim_amount {
    label: "Average Claim Amount"
    type: average
    sql: ${dim_claim_amount} ;;
    value_format_name: usd
    filters: {
      field: dim_claim_amount
      value: ">0.00"
    }
  }

  dimension: refer_to_underwriters {
    label: "xIs Referred to U/w"
    type: string
    sql: ${TABLE}.ReferToUnderwriters ;;
  }

  dimension_group: refer_to_underwriters_date {
    label: "xReferred to U/w"
    type: time
    timeframes: [date]
    sql: ${TABLE}.ReferToUnderwritersDate ;;
  }

  dimension: ror {
    label: "xIs ROR"
    type: string
    sql: ${TABLE}.ROR ;;
  }

  dimension_group: rordate {
    label: "xROR"
    type: time
    timeframes: [date]
    sql: ${TABLE}.RORDate ;;
  }

  dimension: subrogation_possible {
    label: "Is Subro Possible"
    type: string
    sql: ${TABLE}.SubrogationPossible ;;
  }

  dimension_group: subrogation_possible_date {
    label: "xSubro Possible"
    type: time
    timeframes: [date]
    sql: ${TABLE}.SubrogationPossibleDate ;;
  }

  dimension: denied {
    label: "xIs Denied"
    type: string
    sql: ${TABLE}.Denied ;;
  }

  dimension_group: denied_date {
    label: "xDenied"
    type: time
    timeframes: [date]
    sql: ${TABLE}.DeniedDate ;;
  }

  dimension: exceeds_authority {
    label: "xIs Exceeds Authority"
    type: string
    sql: ${TABLE}.ExceedsAuthority ;;
  }

  dimension: loss_form_written_under {
    label: "xLoss Form Written Under"
    type: string
    sql: ${TABLE}.LossFormWrittenUnder ;;
  }

#   measure: count {
#     type: count
#     drill_fields: [id]
#   }
}
