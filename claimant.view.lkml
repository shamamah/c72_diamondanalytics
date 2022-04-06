view: claimant {
  sql_table_name: dbo.Claimant ;;

  #SH 2019-12-19 TT294238
  dimension: compound_primary_key {
    type: string
    primary_key: yes
    hidden: yes
    sql: CONCAT(${claimcontrol_id},${claimant_num}) ;;
  }

#   dimension: activity_involved {
#     type: string
#     sql: ${TABLE}.activity_involved ;;
#   }
#
#   dimension_group: added {
#     type: time
#     timeframes: [
#       raw,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     convert_tz: no
#     datatype: date
#     sql: ${TABLE}.added_date ;;
#   }
#
#   dimension: additionalpolicyholder_num {
#     type: number
#     sql: ${TABLE}.additionalpolicyholder_num ;;
#   }
#
#   dimension_group: admin_notified {
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}.admin_notified_date ;;
#   }
#
#   dimension: applicant_num {
#     type: number
#     sql: ${TABLE}.applicant_num ;;
#   }
#
#   dimension: average_weekly_wage {
#     type: string
#     sql: ${TABLE}.average_weekly_wage ;;
#   }
#
#   dimension: benefitpaymenttotype_id {
#     type: number
#     sql: ${TABLE}.benefitpaymenttotype_id ;;
#   }
#
#   dimension: carrier_claim_number {
#     type: string
#     sql: ${TABLE}.carrier_claim_number ;;
#   }
#
#   dimension: carrier_policy_number {
#     type: string
#     sql: ${TABLE}.carrier_policy_number ;;
#   }
#
#   dimension: carrier_remark {
#     type: string
#     sql: ${TABLE}.carrier_remark ;;
#   }

  dimension: claimant_num {
    label: "Number"
    hidden: no
    type: number
    sql: ${TABLE}.claimant_num ;;
  }

#   dimension: claimantstatus_id {
#     type: number
#     sql: ${TABLE}.claimantstatus_id ;;
#   }
#
#   dimension: claimanttype_id {
#     type: number
#     sql: ${TABLE}.claimanttype_id ;;
#   }
#
#   dimension: claimattorney_id {
#     type: number
#     sql: ${TABLE}.claimattorney_id ;;
#   }
#
#   dimension: claimattorney_num {
#     type: number
#     sql: ${TABLE}.claimattorney_num ;;
#   }
#
#   dimension: claimbenefittypecode_id {
#     type: number
#     sql: ${TABLE}.claimbenefittypecode_id ;;
#   }
#
#   dimension: claimcareprovider_id {
#     type: number
#     sql: ${TABLE}.claimcareprovider_id ;;
#   }
#
#   dimension: claimcarrier_id {
#     type: number
#     sql: ${TABLE}.claimcarrier_id ;;
#   }
#
#   dimension: claimcarrieradjuster_id {
#     type: number
#     sql: ${TABLE}.claimcarrieradjuster_id ;;
#   }
#
#   dimension: claimclueoperator_id {
#     type: number
#     sql: ${TABLE}.claimclueoperator_id ;;
#   }

  dimension: claimcontrol_id {
    hidden: yes
    type: number
    sql: ${TABLE}.claimcontrol_id ;;
  }

#   dimension: claimcontrolproperty_num {
#     type: number
#     sql: ${TABLE}.claimcontrolproperty_num ;;
#   }
#
#   dimension: claimcontrolvehicle_num {
#     type: number
#     sql: ${TABLE}.claimcontrolvehicle_num ;;
#   }
#
#   dimension: claimfinancials_num {
#     type: number
#     sql: ${TABLE}.claimfinancials_num ;;
#   }
#
#   dimension: claimfirm_id {
#     type: number
#     sql: ${TABLE}.claimfirm_id ;;
#   }
#
#   dimension: claimfirmattorney_claimfirm_id {
#     type: number
#     sql: ${TABLE}.claimfirmattorney_claimfirm_id ;;
#   }

  dimension: claimpayee_id {
    hidden: yes
    type: number
    sql: ${TABLE}.claimpayee_id ;;
  }

  dimension: contacted {
    label: "Is Contacted"
    type: string
    sql: Case When ${TABLE}.contacted=1 Then 'Yes' Else 'No' End ;;
  }

  dimension_group: contacted_date {
    label: "Contacted"
    type: time
    timeframes: [time,date,week,month,quarter,year]
    sql: Case When ${TABLE}.contacted_date<'1900-01-01' Then NULL Else ${TABLE}.contacted_date End ;;
  }
#
#   dimension: cpt_code {
#     type: string
#     sql: ${TABLE}.cpt_code ;;
#   }
#
#   dimension_group: date_hired {
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}.date_hired ;;
#   }
#
#   dimension_group: date_of_disability {
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}.date_of_disability ;;
#   }
#
#   dimension_group: date_of_retirement {
#     type: time
#     timeframes: [
#       raw,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     convert_tz: no
#     datatype: date
#     sql: ${TABLE}.date_of_retirement ;;
#   }
#
#   dimension_group: date_of_return {
#     type: time
#     timeframes: [
#       raw,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     convert_tz: no
#     datatype: date
#     sql: ${TABLE}.date_of_return ;;
#   }
#
#   dimension_group: date_of_strike {
#     type: time
#     timeframes: [
#       raw,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     convert_tz: no
#     datatype: date
#     sql: ${TABLE}.date_of_strike ;;
#   }
#
#   dimension: days_per_week {
#     type: number
#     sql: ${TABLE}.days_per_week ;;
#   }
#
#   dimension: department_of_location {
#     type: string
#     sql: ${TABLE}.department_of_location ;;
#   }
#
#   dimension: dependents {
#     type: number
#     sql: ${TABLE}.dependents ;;
#   }
#
#   dimension: driver_num {
#     type: number
#     sql: ${TABLE}.driver_num ;;
#   }
#
#   dimension: driverexcludetype_id {
#     type: number
#     sql: ${TABLE}.driverexcludetype_id ;;
#   }
#
#   dimension: employeed_at_time_of_loss {
#     type: string
#     sql: ${TABLE}.employeed_at_time_of_loss ;;
#   }
#
#   dimension_group: employer_notified {
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}.employer_notified_date ;;
#   }
#
#   dimension: employmentstatustype_id {
#     type: number
#     sql: ${TABLE}.employmentstatustype_id ;;
#   }
#
#   dimension: equipment_involved {
#     type: string
#     sql: ${TABLE}.equipment_involved ;;
#   }
#
#   dimension_group: estimated_date_of_return {
#     type: time
#     timeframes: [
#       raw,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     convert_tz: no
#     datatype: date
#     sql: ${TABLE}.estimated_date_of_return ;;
#   }
#
#   dimension: external_unit_identifier {
#     type: string
#     sql: ${TABLE}.external_unit_identifier ;;
#   }
#
#   dimension: gross_income {
#     type: string
#     sql: ${TABLE}.gross_income ;;
#   }
#
#   dimension: hours_per_day {
#     type: number
#     sql: ${TABLE}.hours_per_day ;;
#   }
#
#   dimension: injury {
#     type: string
#     sql: ${TABLE}.injury ;;
#   }
#
#   dimension: is_insured1 {
#     type: string
#     sql: ${TABLE}.is_insured1 ;;
#   }
#
#   dimension: is_insured2 {
#     type: string
#     sql: ${TABLE}.is_insured2 ;;
#   }
#
#   dimension: is_invalid_iso_data {
#     type: string
#     sql: ${TABLE}.is_invalid_iso_data ;;
#   }
#
#   dimension: is_represented {
#     type: string
#     sql: ${TABLE}.is_represented ;;
#   }
#
#   dimension_group: last_modified {
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}.last_modified_date ;;
#   }
#
#   dimension_group: last_work {
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}.last_work_date ;;
#   }
#
#   dimension: medicare_recipient {
#     type: string
#     sql: ${TABLE}.medicare_recipient ;;
#   }
#
#   dimension: medicare_waiver_received {
#     type: string
#     sql: ${TABLE}.medicare_waiver_received ;;
#   }
#
#   dimension: minor_medical {
#     type: string
#     sql: ${TABLE}.minor_medical ;;
#   }
#
#   dimension: ncci_class_code {
#     type: string
#     sql: ${TABLE}.ncci_class_code ;;
#   }
#
#   dimension: occupation {
#     type: string
#     sql: ${TABLE}.occupation ;;
#   }
#
#   dimension: occupationtype_id {
#     type: number
#     sql: ${TABLE}.occupationtype_id ;;
#   }
#
#   dimension: occurred_on_premises {
#     type: string
#     sql: ${TABLE}.occurred_on_premises ;;
#   }
#
#   dimension_group: paid_day_of_injury {
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}.paid_day_of_injury ;;
#   }

  # SH 2019-12-18 TT294238, need this dimension to know when a claimant was added on the claim
  dimension_group: pcadded {
    label: "Added"
    type: time
    timeframes: [time,date,week,month,quarter,year]
    sql: ${TABLE}.pcadded_date ;;
  }

#   dimension_group: prepared {
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}.prepared_date ;;
#   }
#
#   dimension_group: prior3qtr_from {
#     type: time
#     timeframes: [
#       raw,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     convert_tz: no
#     datatype: date
#     sql: ${TABLE}.prior3qtr_from_date ;;
#   }
#
#   dimension: prior3qtr_hours {
#     type: number
#     sql: ${TABLE}.prior3qtr_hours ;;
#   }
#
#   dimension_group: prior3qtr_to {
#     type: time
#     timeframes: [
#       raw,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     convert_tz: no
#     datatype: date
#     sql: ${TABLE}.prior3qtr_to_date ;;
#   }
#
#   dimension: prior3qtr_weeks {
#     type: number
#     sql: ${TABLE}.prior3qtr_weeks ;;
#   }
#
#   dimension: process_involved {
#     type: string
#     sql: ${TABLE}.process_involved ;;
#   }
#
#   dimension: property_dscr {
#     type: string
#     sql: ${TABLE}.property_dscr ;;
#   }
#
#   dimension: relationship_id {
#     type: number
#     sql: ${TABLE}.relationship_id ;;
#   }
#
#   dimension: salary_continued {
#     type: string
#     sql: ${TABLE}.salary_continued ;;
#   }
#
#   dimension: state_id {
#     type: number
#     sql: ${TABLE}.state_id ;;
#   }
#
#   dimension_group: statute_of_limitations {
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}.statute_of_limitations ;;
#   }
#
#   dimension: supervisor_name {
#     type: string
#     sql: ${TABLE}.supervisor_name ;;
#   }
#
#   dimension_group: termination {
#     type: time
#     timeframes: [
#       raw,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     convert_tz: no
#     datatype: date
#     sql: ${TABLE}.termination_date ;;
#   }
#
#   dimension_group: time_workday_begin {
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}.time_workday_begin ;;
#   }
#
#   dimension: unit_num {
#     type: number
#     sql: ${TABLE}.unit_num ;;
#   }
#
#   dimension: users_id {
#     type: number
#     sql: ${TABLE}.users_id ;;
#   }
#
#   dimension: wage {
#     type: string
#     sql: ${TABLE}.wage ;;
#   }
#
#   dimension: workcomp {
#     type: string
#     sql: ${TABLE}.workcomp ;;
#   }

  # SH 2019-12-18 TT294238, need this dimension to know when a claimant was added on the claim
  # dimension: contacted_same_day {
  #   label: "Contacted Same Day (Y/N)"
  #   type: string
  #   sql: case when ${TABLE}.contacted=1 Then (case when datediff(dd,${TABLE}.pcadded_date,${TABLE}.contacted_date)=0 then 'Yes' else 'No' end) else NULL end ;;
  # }

  # SH 2019-12-18 TT294238, need this dimension to know when a claimant was added on the claim
  dimension: contact_within {
    label: "Contacted Within"
    type: string
    sql:  case when ${TABLE}.contacted = 1 then (
            case
              when datediff(dd,${TABLE}.pcadded_date,${TABLE}.contacted_date) = 0   then 'Same Day'
              when datediff(hh,${TABLE}.pcadded_date,${TABLE}.contacted_date) <= 24 then 'Within 24 Hours'
            else 'Over 24 hours'
            end)
          else 'Not contacted'
          end ;;
  }

#   dimension_group: contacted_date {
#     label: "Contacted"
#     type: time
#     timeframes: [time,date,week,month,quarter,year]
#     sql: Case When ${TABLE}.contacted_date<'1900-01-01' Then NULL Else ${TABLE}.contacted_date End ;;
#   }
#
#   dimension_group: pcadded {
#     label: "Added"
#     type: time
#     timeframes: [time,date,week,month,quarter,year]
#     sql: ${TABLE}.pcadded_date ;;
#   }

#   measure: count {
#     type: count
#     drill_fields: [supervisor_name]
#   }
}
