view: dt_claim_feature_as_of_date {
  derived_table: {
    sql: SELECT claim_Feature.*, claim_activity_code.dscr AS current_feature_status
      FROM dbo.ClaimFeature claim_Feature (NOLOCK)
      INNER JOIN dbo.ClaimFeatureActivity claim_feature_activity (NOLOCK)
        ON claim_feature_activity.claimcontrol_id = claim_Feature.claimcontrol_id
          AND claim_feature_activity.claimant_num = claim_Feature.claimant_num
          AND claim_feature_activity.claimfeature_num = claim_Feature.claimfeature_num
          AND claim_feature_activity.num = (SELECT MAX(num)
                 FROM dbo.ClaimFeatureActivity (NOLOCK)
                 WHERE claimactivitycode_id IN (1,2) -- Open/Close
                 --WHERE
                  AND
                    {% condition as_of_date %} added {% endcondition %}  --<= '01/01/2020'  --@specific_date
                  AND
                    claimcontrol_id = claim_feature_activity.claimcontrol_id
                  AND
                    claimant_num = claim_feature_activity.claimant_num
                  AND
                    claimfeature_num = claim_feature_activity.claimfeature_num)
      INNER JOIN dbo.ClaimActivityCode claim_activity_code (NOLOCK)
         ON claim_feature_activity.claimactivitycode_id = claim_activity_code.claimactivitycode_id
       ;;
  }

  filter: as_of_date {
    type: date
    hidden: no
    label: "As of Date"
  }

  measure: count {
    type: count
    drill_fields: [detail*]
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
    label: "Feature Number"
    type: number
    sql: ${TABLE}.claimfeature_num ;;
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

  dimension: claimsubcoverage_num {
    hidden: yes
    type: number
    sql: ${TABLE}.claimsubcoverage_num ;;
  }

  dimension: deductible_applied {
    type: string
    sql: case when ${TABLE}.deductible_applied = 'true' then 'Yes' else 'No' end ;;
  }

  dimension: deductible_amount {
    hidden: yes
    type: string
    sql: ${TABLE}.deductible_amount ;;
  }

  dimension: first_indemnity_reserve_set {
    hidden: yes
    type: string
    sql: ${TABLE}.first_indemnity_reserve_set ;;
  }

  dimension: first_indemnity_reserve_num {
    hidden: yes
    type: number
    sql: ${TABLE}.first_indemnity_reserve_num ;;
  }

  dimension: first_indemnity_reserve {
    hidden: yes
    type: string
    sql: ${TABLE}.first_indemnity_reserve ;;
  }

  dimension_group: first_indemnity_reserve_date {
    hidden: yes
    type: time
    timeframes: [date,month,year]
    sql: ${TABLE}.first_indemnity_reserve_date ;;
  }

  dimension: first_indemnity_payment_set {
    hidden: yes
    type: string
    sql: ${TABLE}.first_indemnity_payment_set ;;
  }

  dimension: first_indemnity_payment_num {
    hidden: yes
    type: number
    sql: ${TABLE}.first_indemnity_payment_num ;;
  }

  dimension_group: reported_date {
    type: time
    timeframes: [date,month,year]
    sql: ${TABLE}.reported_date ;;
  }

  dimension: claimreportedby_id {
    hidden: yes
    type: number
    sql: ${TABLE}.claimreportedby_id ;;
  }

  dimension: claimreportedbymethod_id {
    hidden: yes
    type: number
    sql: ${TABLE}.claimreportedbymethod_id ;;
  }

  dimension: dscr {
    hidden: yes
    type: string
    sql: ${TABLE}.dscr ;;
  }

  dimension: notify_underwriting {
    hidden: yes
    type: string
    sql: ${TABLE}.notify_underwriting ;;
  }

  dimension: perperson_limit {
    hidden: yes
    label: "Per Person Limit"
    type: string
    sql: ${TABLE}.perperson_limit ;;
  }

  dimension: peroccur_limit {
    hidden: yes
    label: "Per Occurrence Limit"
    type: string
    sql: ${TABLE}.peroccur_limit ;;
  }

  dimension: deductible {
    type: string
    sql: ${TABLE}.deductible ;;
  }

  dimension: exposure_dscr {
    label: "Exposure"
    type: string
    sql: ${TABLE}.exposure_dscr ;;
  }

  dimension: subexposure_dscr {
    label: "Subexposure"
    type: string
    sql: ${TABLE}.subexposure_dscr ;;
  }

  dimension: coverage_dscr {
    label: "Coverage Type"
    type: string
    sql: ${TABLE}.coverage_dscr ;;
  }

  dimension: subcoverage_dscr {
    label: "Subcoverage"
    type: string
    sql: ${TABLE}.subcoverage_dscr ;;
  }

  dimension: inside_adjuster_id {
    hidden: yes
    type: number
    sql: ${TABLE}.inside_adjuster_id ;;
  }

  dimension: outside_adjuster_id {
    hidden: yes
    type: number
    sql: ${TABLE}.outside_adjuster_id ;;
  }

  dimension: in_litigation {
    hidden: yes
    type: string
    sql: ${TABLE}.in_litigation ;;
  }

  dimension: in_suit {
    hidden: yes
    type: string
    sql: ${TABLE}.in_suit ;;
  }

  dimension: in_salvage {
    hidden: yes
    type: string
    sql: ${TABLE}.in_salvage ;;
  }

  dimension: zero_tort {
    hidden: yes
    type: string
    sql: ${TABLE}.zero_tort ;;
  }

  dimension: record_only {
    hidden: yes
    type: string
    sql: ${TABLE}.record_only ;;
  }

  dimension: tort_id {
    hidden: yes
    type: number
    sql: ${TABLE}.tort_id ;;
  }

  dimension: users_id {
    hidden: yes
    type: number
    sql: ${TABLE}.users_id ;;
  }

  # dimension_group: added {
  #   type: time
  #   sql: ${TABLE}.added ;;
  # }

  dimension_group: clue_date {
    hidden: yes
    type: time
    timeframes: [date,month,year]
    sql: ${TABLE}.clue_date ;;
  }

  dimension: reopened {
    label: "Re-opened"
    type: string
    sql: case when ${TABLE}.reopened = 'true' then 'Yes' else 'No' end ;;
  }

  dimension_group: reopened_date {
    label: "Re-open"
    type: time
    timeframes: [date,month,year]
    sql: ${TABLE}.reopened_date ;;
  }

  dimension: claimfeature_userdef_1_id {
    hidden: yes
    type: number
    sql: ${TABLE}.claimfeature_userdef_1_id ;;
  }

  dimension: claimfeature_userdef_2_id {
    hidden: yes
    type: number
    sql: ${TABLE}.claimfeature_userdef_2_id ;;
  }

  dimension: claimfeature_userdef_3_id {
    hidden: yes
    type: number
    sql: ${TABLE}.claimfeature_userdef_3_id ;;
  }

  dimension: claimfeaturestatus_id {
    hidden: yes
    type: number
    sql: ${TABLE}.claimfeaturestatus_id ;;
  }

  dimension: claimfinancials_num {
    hidden: yes
    type: number
    sql: ${TABLE}.claimfinancials_num ;;
  }

  dimension_group: added {
    label: "Added"
    type: time
    timeframes: [date,month,year]
    sql: ${TABLE}.added_date ;;
  }

  dimension_group: pcadded_date {
    hidden: yes
    type: time
    sql: ${TABLE}.pcadded_date ;;
  }

  dimension: deductible_waived {
    type: string
    sql: case when ${TABLE}.deductible_waived = 'true' then 'Yes' else 'No' end ;;
  }

  dimension: old_exposure_id {
    hidden: yes
    type: number
    sql: ${TABLE}.old_exposure_id ;;
  }

  dimension: old_subexposure_id {
    hidden: yes
    type: number
    sql: ${TABLE}.old_subexposure_id ;;
  }

  dimension: old_subexposure_num {
    hidden: yes
    type: number
    sql: ${TABLE}.old_subexposure_num ;;
  }

  dimension: old_subexposure_ver {
    hidden: yes
    type: number
    sql: ${TABLE}.old_subexposure_ver ;;
  }

  dimension: old_coverage_num {
    hidden: yes
    type: number
    sql: ${TABLE}.old_coverage_num ;;
  }

  dimension: old_coveragecode_id {
    hidden: yes
    type: number
    sql: ${TABLE}.old_coveragecode_id ;;
  }

  dimension: old_subcoveragecode_id {
    hidden: yes
    type: number
    sql: ${TABLE}.old_subcoveragecode_id ;;
  }

  dimension: claimoffice_id {
    hidden: yes
    type: number
    sql: ${TABLE}.claimoffice_id ;;
  }

  dimension_group: last_modified_date {
    hidden: yes
    type: time
    sql: ${TABLE}.last_modified_date ;;
  }

  dimension: coverage_limitations {
    hidden: yes
    type: string
    sql: ${TABLE}.coverage_limitations ;;
  }

  dimension_group: statute_of_limitations_date {
    hidden: yes
    type: time
    sql: ${TABLE}.statute_of_limitations_date ;;
  }

  dimension: waive_iso_reporting {
    hidden: yes
    type: string
    sql: ${TABLE}.waive_iso_reporting ;;
  }

  dimension: corvel_approved_amount {
    hidden: yes
    type: string
    sql: ${TABLE}.corvel_approved_amount ;;
  }

  dimension: exclude_from_medical {
    hidden: yes
    type: string
    sql: ${TABLE}.exclude_from_medical ;;
  }

  dimension: attorney_involved_date {
    hidden: yes
    type: date
    sql: ${TABLE}.attorney_involved_date ;;
  }

  dimension_group: claimdenial_date {
    hidden: yes
    type: time
    sql: ${TABLE}.claimdenial_date ;;
  }

  dimension: denied {
    type: string
    sql: case when ${TABLE}.denied = 'true' then 'Yes' else 'No' end ;;
  }

  dimension: claimdenialreason_remarks {
    hidden: yes
    type: string
    sql: ${TABLE}.claimdenialreason_remarks ;;
  }

  dimension: claimdenialusers_id {
    hidden: yes
    type: number
    sql: ${TABLE}.claimdenialusers_id ;;
  }

  dimension: claimdenialreason_id {
    hidden: yes
    type: number
    sql: ${TABLE}.claimdenialreason_id ;;
  }

  dimension: deductible_available_amount {
    hidden: yes
    type: string
    sql: ${TABLE}.deductible_available_amount ;;
  }

  dimension: deductible_applied_amount {
    hidden: yes
    type: string
    sql: ${TABLE}.deductible_applied_amount ;;
  }

  dimension: in_litigation_yesno_id {
    hidden: yes
    type: number
    sql: ${TABLE}.in_litigation_yesno_id ;;
  }

  dimension: claimfeatureclosereason_id {
    hidden: yes
    type: number
    sql: ${TABLE}.claimfeatureclosereason_id ;;
  }

  dimension: claimsubropotentialtype_id {
    hidden: yes
    type: number
    sql: ${TABLE}.claimsubropotentialtype_id ;;
  }

  dimension: is_early_settlement_opportunity {
    hidden: yes
    type: string
    sql: ${TABLE}.is_early_settlement_opportunity ;;
  }

  dimension: current_feature_status {
    label: "Status"
    type: string
    sql: ${TABLE}.current_feature_status ;;
  }

  set: detail {
    fields: [
      claimcontrol_id,
      claimant_num,
      claimfeature_num,
      # claimexposure_id,
      # claimsubexposure_num,
      # claimcoverage_num,
      # claimsubcoverage_num,
      # deductible_applied,
      # deductible_amount,
      # first_indemnity_reserve_set,
      # first_indemnity_reserve_num,
      # first_indemnity_reserve,
      # first_indemnity_reserve_date_time,
      # first_indemnity_payment_set,
      # first_indemnity_payment_num,
      # reported_date_time,
      # claimreportedby_id,
      # claimreportedbymethod_id,
      # dscr,
      # notify_underwriting,
      # perperson_limit,
      # peroccur_limit,
      # deductible,
      # exposure_dscr,
      # subexposure_dscr,
      # coverage_dscr,
      # subcoverage_dscr,
      # inside_adjuster_id,
      # outside_adjuster_id,
      # in_litigation,
      # in_suit,
      # in_salvage,
      # zero_tort,
      # record_only,
      # tort_id,
      # users_id,
      # clue_date_time,
      # reopened,
      # reopened_date_time,
      # claimfeature_userdef_1_id,
      # claimfeature_userdef_2_id,
      # claimfeature_userdef_3_id,
      # claimfeaturestatus_id,
      # claimfinancials_num,
      # added_date,
      # pcadded_date_time,
      # deductible_waived,
      # old_exposure_id,
      # old_subexposure_id,
      # old_subexposure_num,
      # old_subexposure_ver,
      # old_coverage_num,
      # old_coveragecode_id,
      # old_subcoveragecode_id,
      # claimoffice_id,
      # last_modified_date_time,
      # coverage_limitations,
      # statute_of_limitations_date_time,
      # waive_iso_reporting,
      # corvel_approved_amount,
      # exclude_from_medical,
      # attorney_involved_date,
      # claimdenial_date_time,
      # denied,
      # claimdenialreason_remarks,
      # claimdenialusers_id,
      # claimdenialreason_id,
      # deductible_available_amount,
      # deductible_applied_amount,
      # in_litigation_yesno_id,
      # claimfeatureclosereason_id,
      # claimsubropotentialtype_id,
      # is_early_settlement_opportunity,
      current_feature_status
    ]
  }
}
