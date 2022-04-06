view: dt_coverage_financials_umbi_0 {
  derived_table: {
    sql: select cfin.claimcontrol_id
        , cf.claimant_num
        , SUM(cfin.indemnity_reserve) as 'loss_reserves'
        , SUM(cfin.indemnity_paid) as 'loss_paid'
        , SUM(cfin.salvage) as 'salvage'
        , SUM(cfin.subro) as 'subro'
      from claimcontrol cc with(nolock)
        inner join ClaimFeature cf on cf.claimcontrol_id = cc.claimcontrol_id
        inner join ClaimFinancials cfin with(nolock) on cfin.claimcontrol_id = cf.claimcontrol_id
          and cfin.claimfinancials_num = cf.claimfinancials_num
        inner join ClaimCoverage ccov with(nolock) on ccov.claimcontrol_id = cf.claimcontrol_id
                and ccov.claimexposure_id = cf.claimexposure_id
                and ccov.claimsubexposure_num = cf.claimsubexposure_num
          and ccov.claimcoverage_num = cf.claimcoverage_num
        left outer join ClaimSubCoverage scs with(nolock) on ccov.claimcontrol_id = cf.claimcontrol_id
                and scs.claimexposure_id = cf.claimexposure_id
                and scs.claimsubexposure_num = cf.claimsubexposure_num
          and scs.claimcoverage_num = cf.claimcoverage_num
                and scs.claimsubcoverage_num = cf.claimsubcoverage_num
      where ISNULL(scs.coveragecode_id, ccov.coveragecode_id) = 8
      group by cfin.claimcontrol_id, cf.claimant_num
 ;;
  }

  dimension: compound_primary_key {
    type: string
    primary_key: yes
    hidden: yes
    sql: CONCAT(${claimcontrol_id},${claimant_num}) ;;
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

  dimension: dim_loss_reserves {
    hidden: yes
    type: string
    sql: ${TABLE}.loss_reserves ;;
  }

  measure: loss_reserves {
    type: sum
    label: "UM/UIM BI Loss Reserves"
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
    label: "UM/UIM BI Paids"
    sql: ${dim_loss_paid} ;;
    value_format_name: usd
  }

  dimension: dim_salvage {
    hidden: yes
    type: string
    sql: ${TABLE}.salvage ;;
  }

  measure: salvage {
    type: sum
    label: "UM/UIM BI Salvage"
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
    label: "UM/UIM BI Subro"
    sql: ${dim_subro} ;;
    value_format_name: usd
  }
}
