view: dt_coverage_financials_coll_1 {
  derived_table: {
    sql:

      SELECT CF.claimcontrol_id
            ,CF.claimant_num
            ,CF.claimfeature_num
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
            ON CCOV.claimcontrol_id = CF.claimcontrol_id
              AND SCS.claimexposure_id = CF.claimexposure_id
              AND SCS.claimsubexposure_num = CF.claimsubexposure_num
              AND SCS.claimcoverage_num = CF.claimcoverage_num
              AND SCS.claimsubcoverage_num = CF.claimsubcoverage_num

      WHERE ISNULL(SCS.coveragecode_id, CCOV.coveragecode_id) = 5
              AND {% condition dt_claim_transactions_as_of.as_of_date %} V.eff_date {% endcondition %}

      GROUP BY CF.claimcontrol_id, CF.claimant_num, CF.claimfeature_num
    ;;
  }


  dimension: compound_primary_key {
    type: string
    primary_key: yes
    hidden: yes
    sql: CONCAT(${claimcontrol_id},${claimant_num},${claimfeature_num}) ;;
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

  dimension: claimfeature_num {
    hidden: yes
    type: number
    sql: ${TABLE}.claimfeature_num ;;
  }

  dimension: dim_loss_reserves {
    hidden: yes
    type: string
    sql: ${TABLE}.loss_reserves ;;
  }

  measure: loss_reserves {
    type: sum
    label: "COLL Loss Reserves"
    sql: ${dim_loss_reserves} ;;
    value_format_name: usd
  }

  dimension: dim_loss_paid {
    hidden: yes
    type: string
    sql: ${TABLE}.loss_paid ;;
  }

  measure: loss_paid {
    type: sum
    label: "COLL Paids"
    sql: ${dim_loss_paid} ;;
    value_format_name: usd
  }

  measure: loss_incurred {
    type: number
    label: "COLL Incurred $"
    sql: ${loss_reserves} + ${loss_paid}  ;;
    value_format_name: usd
    drill_fields: [open_claims_incurred_stat*]
  }

  measure:  percent_loss_incurred {
    type: number
    label: "COLL Incurred %"
    sql:  case when ${dt_coverage_financials_bi.total_incurred} = 0 then 0 else ${loss_incurred} / ${dt_coverage_financials_bi.total_incurred} end ;;
    value_format_name: percent_1
    drill_fields: [open_claims_incurred_stat*]
  }

  dimension: dim_salvage {
    hidden: yes
    type: string
    sql: ${TABLE}.salvage ;;
  }

  measure: salvage {
    type: sum
    label: "COLL Salvage"
    sql: ${dim_salvage} ;;
    value_format_name: usd
  }

  dimension: dim_subro {
    hidden: yes
    type: string
    sql: ${TABLE}.subro ;;
  }

  measure: subro {
    type: sum
    label: "COLL Subro"
    sql: ${dim_subro} ;;
    value_format_name: usd
  }

  set: open_claims_incurred_stat {
    fields: [
      claim_control.claim_number,
      claim_loss_type.dscr,
      claim_type.dscr,
      claim_severity.dscr,
      claim_control.loss_date_date,
      claim_control.reported_date_date,
      dt_claim_days_open.days_open,
      dt_claim_close_date.claim_close_date_date,
      dt_claim_inside_adjuster.initials,
      dt_coverage_financials_bi.loss_incurred,
      dt_coverage_financials_pd.loss_incurred,
      dt_coverage_financials_med.loss_incurred,
      dt_coverage_financials_pip.loss_incurred,
      dt_coverage_financials_comp.loss_incurred,
      dt_coverage_financials_coll.loss_incurred,
      dt_coverage_financials_umbi.loss_incurred,
      dt_coverage_financials_umpd.loss_incurred,
      dt_coverage_financials_rr.loss_incurred
    ]
  }
}
