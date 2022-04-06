view: dt_coverage_financials {
  derived_table: {
    sql:

      SELECT CF.claimcontrol_id
              ,CF.claimant_num
              ,COVCD.coveragecode
              ,SUM(V.indemnity_reserve) as 'loss_reserves'
              ,SUM(V.indemnity_paid) as 'loss_paid'
              ,SUM(V.salvage) as 'salvage'
              ,SUM(V.subro) as 'subro'

      FROM ClaimFeature CF

        INNER JOIN dbo.vClaimTransactionPostedDateAsEffDate V WITH(NOLOCK)
          ON CF.claimcontrol_id = V.claimcontrol_id
            AND CF.claimant_num = V.claimant_num
            AND CF.claimfeature_num = V.claimfeature_num
            AND V.claimtransactionstatus_id IN (1, 4, 7)

        INNER JOIN ClaimCoverage CCOV WITH(NOLOCK)
          ON ccov.claimcontrol_id = CF.claimcontrol_id
            AND CCOV.claimexposure_id = CF.claimexposure_id
            AND CCOV.claimsubexposure_num = CF.claimsubexposure_num
            AND CCOV.claimcoverage_num = CF.claimcoverage_num

        LEFT OUTER JOIN ClaimSubCoverage SCS WITH(NOLOCK)
          ON SCS.claimcontrol_id = CF.claimcontrol_id
            AND SCS.claimexposure_id = CF.claimexposure_id
            AND SCS.claimsubexposure_num = CF.claimsubexposure_num
            AND SCS.claimcoverage_num = CF.claimcoverage_num
            AND SCS.claimsubcoverage_num = CF.claimsubcoverage_num

        INNER JOIN CoverageCode COVCD WITH(NOLOCK)
          ON covcd.coveragecode_id = ISNULL(SCS.coveragecode_id, CCOV.coveragecode_id)


        WHERE ISNULL(SCS.coveragecode_id, CCOV.coveragecode_id) IN (1,5,3,6,4,80038,14,8,9)

        GROUP BY CF.claimcontrol_id, CF.claimant_num, CF.claimfeature_num, COVCD.coveragecode
          ;;
  }

  dimension: compound_primary_key {
    type: string
    primary_key: yes
    hidden: yes
    sql: CONCAT(${claimcontrol_id},${claimant_num},${coveragecode}) ;;
  }

  dimension: claimcontrol_id {
    hidden: yes
    type: number
    sql: ${TABLE}.claimcontrol_id ;;
  }

  dimension: claimant_num {
    hidden: yes
    type: number
    sql: ${TABLE}.claimant_num ;;
  }

  dimension: coveragecode {
    label: "Feature Description"
    type: string
    sql: ${TABLE}.coveragecode ;;
  }



  ## RESERVES ##

  dimension: dim_loss_reserves {
    hidden: yes
    type: number
    sql: ${TABLE}.loss_reserves ;;
  }

  measure: ave_loss_reserves {
    label: "Average Reserves $"
    type: average
    sql: ${dim_loss_reserves} ;;
    value_format_name: usd
    drill_fields: [reserves_details*]
    filters: {
      field: dim_loss_reserves
      value: ">0.00"
    }
  }

  measure: loss_reserves {
    label: "Reserves $"
    type: sum
    sql: ${dim_loss_reserves} ;;
    value_format_name: usd
    drill_fields: [reserves_details*]
  }

  measure: perc_loss_reserves {
    label: "% Reserves"
    type: percent_of_total
    sql: ${loss_reserves} ;;
    value_format: "0.00\%"
    drill_fields: [reserves_details*]
  }



  ## PAID ##

  dimension: dim_loss_paid {
    hidden: yes
    type: number
    sql: ${TABLE}.loss_paid ;;
  }

  measure: ave_loss_paid {
    label: "Average Paid $"
    type: average
    sql: ${dim_loss_paid} ;;
    value_format_name: usd
    drill_fields: [paid_details*]
    filters: {
      field: dim_loss_paid
      value: ">0.00"
    }
  }

  measure: loss_paid {
    label: "Paid $"
    type: sum
    sql: ${dim_loss_paid} ;;
    value_format_name: usd
    drill_fields: [paid_details*]
  }

  measure: perc_loss_paid {
    label: "% Paid"
    type: percent_of_total
    sql: ${loss_paid} ;;
    value_format: "0.00\%"
    drill_fields: [paid_details*]
  }



  ## INCURRED ##

  dimension: dim_loss_incurred {
    hidden: yes
    type: number
    sql: ${dim_loss_reserves} + ${dim_loss_paid} ;;
    value_format_name: usd
  }

  measure: ave_loss_incurred {
    label: "Average Incurred $"
    type: average
    sql: ${dim_loss_incurred} ;;
    value_format_name: usd
    drill_fields: [incurred_details*]
    filters: {
      field: dim_loss_incurred
      value: ">0.00"
    }
  }

  measure: loss_incurred {
    label: "Incurred $"
    type: sum
    sql: ${dim_loss_incurred} ;;
    value_format_name: usd
    drill_fields: [incurred_details*]
  }

  measure: perc_loss_incurred {
    label: "% Incurred"
    type: percent_of_total
    sql: ${loss_incurred} ;;
    value_format: "0.00\%"
    drill_fields: [incurred_details*]
  }



  ## SALVAGE ##

  dimension: dim_salvage {
    hidden: yes
    type: string
    sql: ${TABLE}.salvage ;;
  }

  measure: ave_salvage {
    label: "Average Salvage $"
    type: average
    sql: ${dim_salvage} ;;
    value_format_name: usd
    drill_fields: [salvage_details*]
    filters: {
      field: dim_salvage
      value: ">0.00"
    }
  }

  measure: salvage {
    label: "Salvage $"
    type: sum
    sql: ${dim_salvage} ;;
    value_format_name: usd
  }

  measure: perc_salvage {
    label: "% Salvage"
    type: percent_of_total
    sql: ${salvage} ;;
    value_format: "0.00\%"
    drill_fields: [salvage_details*]
  }



  ## SUBRO ##

  dimension: dim_subro {
    hidden: yes
    type: string
    sql: ${TABLE}.subro ;;
  }

  measure: ave_subro {
    label: "Average Subro $"
    type: average
    sql: ${dim_subro} ;;
    value_format_name: usd
    drill_fields: [subro_details*]
    filters: {
      field: dim_subro
      value: ">0.00"
    }
  }

  measure: subro {
    label: "Subro $"
    type: sum
    sql: ${dim_subro} ;;
    value_format_name: usd
  }

  measure: perc_subro {
    label: "% Subro"
    type: percent_of_total
    sql: ${subro} ;;
    value_format: "0.00\%"
    drill_fields: [subro_details*]
  }



  ## DRILL THROUGHS ##

  set: details {
    fields: [
      claim_control.claim_number,
      claim_loss_type.dscr,
      claim_type.dscr,
      claim_severity.dscr,
      claim_control.loss_date_date,
      claim_control.reported_date_date,
      dt_claim_days_open.days_open,
      dt_claim_close_date.claim_close_date_date,
      #dt_claim_feature_activity.feature_open_date_date,
      #dt_claim_feature_activity.feature_close_date_date,
      dt_claim_inside_adjuster.initials,
    ]
  }

  set: reserves_details {
    fields: [
      details*,
      loss_reserves,
    ]
  }

  set: paid_details {
    fields: [
      details*,
      loss_paid,
    ]
  }

  set: incurred_details {
    fields: [
      details*,
      loss_reserves,
      loss_paid,
      loss_incurred,
    ]
  }

  set: salvage_details {
    fields: [
      details*,
      salvage,
    ]
  }

  set: subro_details {
    fields: [
      details*,
      subro,
    ]
  }
}
