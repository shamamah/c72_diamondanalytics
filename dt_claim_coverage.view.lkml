view: dt_claim_coverage {
  derived_table: {
    sql:

    select cc.claimcontrol_id as 'claimcontrol_id'
        ,cc.claimcoverage_num as 'claimcoverage_num'
        ,cc.claimexposure_id as 'claimexposure_id'
        ,cc.claimsubexposure_num as 'claimsubexposure_num'
        ,ce.dscr as 'Exposure'
        ,cd.caption as 'Coverage'
        ,cc.limit_dscr as 'Limit'
        ,cc.deductible_dscr as 'Deductible'
        --SH 2019-12-02 The next two columns and ASL joined table was added
        ,asl.asl as 'asl_code'
        ,asl.[description] as 'asl_description'

      from claimcoverage cc
        --left join claimcontrol clm on clm.claimcontrol_id = cc. claimcontrol_id
        inner join ClaimExposure ce on ce.claimexposure_id = cc.claimexposure_id
        --SH 2020-03-12 Changed table from CoverageCode to CoverageCodeVersion, TT
        inner join CoverageCodeVersion cd on cd.coveragecode_id = cc.coveragecode_id
        inner join ASL asl on asl.asl_id = cc.asl_id

      where 1=1
        --and cc.limit_dscr <> 'Limits on Policy'
        and cd.caption <> 'N/A'
        --SH 2020-02-03  Determined that "cc.claimsubexposure_num < 2" is filtering out some records when joining to this table. Therefore commented out.
        --and cc.claimsubexposure_num < 2
        ;;
  }


  dimension: compound_primary_key {
    type: string
    primary_key: yes
    hidden: yes
    sql: CONCAT(${claimcontrol_id},' ', ${claimcoverage_num}) ;;
  }

  dimension: claimcontrol_id {
    hidden: yes
    type: number
    sql: ${TABLE}.claimcontrol_id ;;
  }

  dimension: claimexposure_id {
    hidden: yes
    type: number
    sql: ${TABLE}.claimexposure_id ;;
  }

  dimension: claimsubexposure_num {
    hidden: yes
    type: number
    sql: ${TABLE}.claimsubexposure_num ;;
  }

  dimension: claimcoverage_num {
    hidden: yes
    type: number
    sql: ${TABLE}.claimcoverage_num ;;
  }

  dimension: exposure {
    label: "Exposure"
    type: string
    sql: ${TABLE}.Exposure ;;
  }

  dimension: coverage {
    label: "Coverage"
    type: string
    sql: ${TABLE}.Coverage ;;
  }

  dimension: coverage_with_number {
    label: "Coverage (with Number)"
    type: string
    sql: CONCAT(IIF(${claimcoverage_num}<10,'[0','['),${claimcoverage_num},'] ',${TABLE}.Coverage);;
  }

  dimension: limit {
    label: "Limit"
    type: string
    sql: ${TABLE}.Limit ;;
  }

  dimension: deductible {
    label: "Deductible"
    type: string
    sql: ${TABLE}.Deductible ;;
  }

  #SH 2019-12-02 Added ASL Code
  dimension: asl_code {
    label: "ASL Code"
    type: string
    sql: ${TABLE}.asl_code ;;
  }

  dimension: asl_description {
    label: "ASL Description"
    type: string
    sql: ${TABLE}.asl_description ;;
  }

  measure: count {
    label: "Count"
    type: count
    drill_fields: [coverage_detail*]
  }

  set: coverage_detail {
    fields: [
      claim_control.claim_number,
      coverage_with_number,
      limit,
      deductible,
      # SH 2019-12-03  Added the asl_code and asl_description to the drill-through list
      asl_code
      #asl_description
    ]
  }



}
