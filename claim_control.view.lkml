view: claim_control {
  #Commented Dimensions are not used for SCS

  sql_table_name: dbo.ClaimControl ;;

  dimension_group: added {
    label: "Processed"
    type: time
    timeframes: [date]
    convert_tz: no
    sql: ${TABLE}.added_date ;;
  }

  # dimension: ccr1_yesno_id {
  #   # NOT USED
  #   hidden: yes
  #   type: number
  #   sql: ${TABLE}.ccr1_yesno_id ;;
  # }

  # dimension: ccr2_yesno_id {
  #   hidden: yes
  #   #type: number
  #   sql: ${TABLE}.ccr2_yesno_id ;;
  # }

  # dimension: claim_amount_requested {
  #   hidden: yes
  #   type: number
  #   sql: ${TABLE}.claim_amount_requested ;;
  # }

  dimension: claim_number {
    link: {
      label: "Open in Diamond"
      url: "https://c72-prod.diamondasaservice.com/DiamondWeb/Employee/Claim/{{ value }}"
      icon_url: "http://www.insuresoft.com/favicon.ico"
    }
    type: string
    label: "Number"
    sql: ${TABLE}.claim_number ;;
  }

  # dimension: current_policy {
  #   link: {
  #     label: "Open in Diamond"
  #     url: "https://demo.diamondasaservice.com/DiamondWeb/Employee/Policy/{{ value }}"
  #     icon_url: "http://www.insuresoft.com/favicon.ico"
  #   }
  #   type: string
  #   sql: ${TABLE}.current_policy ;;
  # }

  dimension: claim_type_id {
    label: "Is Record-Only"
    type: string
    sql: CASE WHEN  ${TABLE}.claim_type_id=3 THEN 'Yes' ELSE 'No' END ;;
  }

  # dimension: claimadministrator_id {
  #   hidden: yes
  #   type: number
  #   sql: ${TABLE}.claimadministrator_id ;;
  # }

  # dimension: claimassistant_id {
  #   hidden: yes
  #   type: number
  #   sql: ${TABLE}.claimassistant_id ;;
  # }

  dimension: claimcatastrophe_id {
    hidden: yes
    type: number
    sql: ${TABLE}.claimcatastrophe_id ;;
  }

  dimension: claimclosereason_id {
    label: "Close Reason Code"
    type: number
    sql: case when ISNULL(${TABLE}.claimclosereason_id,-1)>=0 then ${TABLE}.claimclosereason_id else NULL end  ;;
  }

  # Uncommented on 2019-08-28  TT 286803
  dimension: claimcluedisp_id {
    hidden: yes
    type: number
    sql: ${TABLE}.claimcluedisp_id ;;
  }

  # dimension: claimcontact_id {
  #   hidden: yes
  #   type: number
  #   sql: ${TABLE}.claimcontact_id ;;
  # }

  dimension: claimcontrol_id {
    primary_key: yes
    type: number
    hidden: yes
    sql: ${TABLE}.claimcontrol_id ;;
  }

  dimension: claimcontrolstatus_id {
    label: "Status Code"
    type: number
    hidden: no
    sql: ${TABLE}.claimcontrolstatus_id ;;
  }

  # dimension_group: claimdenial {
  #   hidden: yes
  #   label: "Date: Claim Denial"
  #   type: time
  #   timeframes: [time, date, week, month]
  #   sql: ${TABLE}.claimdenial_date ;;
  # }

  # dimension: claimdenialreason_id {
  #   # NOT USED
  #   hidden: yes
  #   type: number
  #   sql: ${TABLE}.claimdenialreason_id ;;
  # }

  # dimension: claimdenialreason_remarks {
  #   # NOT USED
  #   hidden: yes
  #   label: "Claim Denial Remarks"
  #   type: string
  #   sql: ${TABLE}.claimdenialreason_remarks ;;
  # }

  # dimension: claimdenialusers_id {
  #   # NOT USED
  #   hidden: yes
  #   type: number
  #   sql: ${TABLE}.claimdenialusers_id ;;
  # }

  dimension: claimfault_id {
    # NOT USED
    hidden: yes
    type: number
    sql: ${TABLE}.claimfault_id ;;
  }

  dimension: claimfinancials_num {
    # NOT USED
    hidden: yes
    type: number
    sql: ${TABLE}.claimfinancials_num ;;
  }

  # dimension: claimfiredept_id {
  #   # NOT USED
  #   hidden: yes
  #   type: number
  #   sql: ${TABLE}.claimfiredept_id ;;
  # }

  # dimension_group: claimliabilitydecision_added {
  #   hidden: yes
  #   type: time
  #   timeframes: [date, week, month]
  #   convert_tz: no
  #   sql: ${TABLE}.claimliabilitydecision_added_date ;;
  # }

  # dimension: claimliabilitydecision_percentage {
  #   hidden: yes
  #   type: number
  #   sql: ${TABLE}.claimliabilitydecision_percentage ;;
  # }

  # dimension: claimliabilitydecision_user_id {
  #   hidden: yes
  #   type: number
  #   sql: ${TABLE}.claimliabilitydecision_user_id ;;
  # }

  # dimension: claimliabilitydecisiontype_id {
  #   hidden: yes
  #   type: number
  #   sql: ${TABLE}.claimliabilitydecisiontype_id ;;
  # }

  dimension: claimlnimage_num {
    type: number
    hidden: yes
    sql: ${TABLE}.claimlnimage_num ;;
  }

  dimension: claimlnmaster_id {
    type: number
    hidden: yes
    sql: ${TABLE}.claimlnmaster_id ;;
  }

  # dimension: claimlossdescriptiontype_id {
  #   hidden: yes
  #   type: number
  #   sql: ${TABLE}.claimlossdescriptiontype_id ;;
  # }

  dimension: claimlosstype_id {
    hidden: yes
    type: number
    sql: ${TABLE}.claimlosstype_id ;;
  }

  dimension: claimoffice_id {
    type: number
    hidden: yes
    sql: ${TABLE}.claimoffice_id ;;
  }

  # dimension: claimpolicedept_id {
  #   hidden: yes
  #   type: number
  #   sql: ${TABLE}.claimpolicedept_id ;;
  # }

  # dimension: claimpoliceofficer_id {
  #   hidden: yes
  #   type: number
  #   sql: ${TABLE}.claimpoliceofficer_id ;;
  # }

  dimension: claimreportedby_id {
    type: number
    hidden: yes
    sql: ${TABLE}.claimreportedby_id ;;
  }

  dimension: claimreportedbymethod_id {
    type: number
    hidden: yes
    sql: ${TABLE}.claimreportedbymethod_id ;;
  }

  # dimension: claims_made {
  #   # NOT USED
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.claims_made ;;
  # }

  dimension: claimseverity_id {
    label: "Severity Code"
    type: number
    hidden: no
    sql: ${TABLE}.claimseverity_id ;;
  }

  # dimension: client_id {
  #   hidden: yes
  #   type: number
  #   sql: ${TABLE}.client_id ;;
  # }

  # dimension_group: destruction {
  #   hidden: yes
  #   type: time
  #   timeframes: [time, date, week, month]
  #   sql: ${TABLE}.destruction_date ;;
  # }

  dimension: dscr {
    type: string
    label: "Loss Description"
    sql: ${TABLE}.dscr ;;
  }

  # dimension: external_policy_version_number {
  #   hidden: yes
  #   type: number
  #   sql: ${TABLE}.external_policy_version_number ;;
  # }

  # dimension: external_policysystem_identifier {
  #   hidden: yes
  #   type: number
  #   value_format_name: id
  #   sql: ${TABLE}.external_policysystem_identifier ;;
  # }

  # dimension: fraud_indicator {
  #   # NOT USED
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.fraud_indicator ;;
  # }

  # dimension: has_other_insurance {
  #   # NOT USED
  #   hidden: yes
  #   type: yesno
  #   sql: case when ${TABLE}.has_other_insurance = 'true' then 'Yes' else 'No' end ;;
  # }

  # SH 2020-03-25 Made this data point available per Steve Backman's request via email
  dimension: has_public_adjuster {
    label: "Has Public Adjuster"
    type: string
    sql: case when ${TABLE}.has_public_adjuster = 'true' then 'Yes' else 'No' end ;;
  }

  # dimension: has_related_treatments {
  #   # NOT USED
  #   hidden: yes
  #   type: yesno
  #   sql: case when ${TABLE}.has_related_treatments = 'true' then 'Yes' else 'No' end;;
  # }

  # dimension: hit_and_run_loss {
  #   # NOT USED
  #   hidden: yes
  #   type: yesno
  #   sql: case when ${TABLE}.hit_and_run_loss = 'true' then 'Yes' else 'No' end ;;
  # }

  # dimension_group: hospital_admittance {
  #   # NOT USED
  #   hidden: yes
  #   type: time
  #   timeframes: [time, date, week, month]
  #   sql: ${TABLE}.hospital_admittance_date ;;
  # }

  # dimension_group: hospital_discharge {
  #   # NOT USED
  #   hidden: yes
  #   type: time
  #   timeframes: [time, date, week, month]
  #   sql: ${TABLE}.hospital_discharge_date ;;
  # }

  # dimension: hospital_duration_days {
  #   # NOT USED
  #   hidden: yes
  #   type: number
  #   sql: ${TABLE}.hospital_duration_days ;;
  # }

  # dimension_group: illness_start {
  #   # NOT USED
  #   hidden: yes
  #   type: time
  #   timeframes: [time, date, week, month]
  #   sql: ${TABLE}.illness_start_date ;;
  # }

  # dimension: inside_adjuster_id {
  #   # NOT USED
  #   hidden: yes
  #   type: number
  #   sql: ${TABLE}.inside_adjuster_id ;;
  # }

  # dimension: is_clinic_notified {
  #   # NOT USED
  #   hidden: yes
  #   type: yesno
  #   sql: case when${TABLE}.is_clinic_notified = 'true' then 'Yes' else 'No' end ;;
  # }

  # dimension: is_converted {
  #   # NOT USED
  #   hidden: yes
  #   type: yesno
  #   sql: case when ${TABLE}.is_converted = 'true' then 'Yes' else 'No' end ;;
  # }

  # dimension: is_euthanized {
  #   # NOT USED
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.is_euthanized ;;
  # }

  # dimension: is_euthanized_vet_advice {
  #   # NOT USED
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.is_euthanized_vet_advice ;;
  # }

  # dimension: is_external_policy {
  #   # NOT USED
  #   hidden: yes
  #   type: yesno
  #   sql: case when ${TABLE}.is_external_policy = 'true' then 'Yes' else 'No' end ;;
  # }

  # dimension: is_policy_verified {
  #   # NOT USED
  #   hidden: yes
  #   type: yesno
  #   sql: case when ${TABLE}.is_policy_verified = 'true' then 'Yes' else 'No' end ;;
  # }

  # dimension: is_shell_policy {
  #   # NOT USED
  #   hidden: yes
  #   type: yesno
  #   sql: case when ${TABLE}.is_shell_policy = 'true' then 'Yes' else 'No' end ;;
  # }

  # dimension: is_vacation_cancelled {
  #   # NOT USED
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.is_vacation_cancelled ;;
  # }

  # dimension: is_vacation_planned {
  #   # NOT USED
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.is_vacation_planned ;;
  # }

  # dimension: last_known_location {
  #   # NOT USED
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.last_known_location ;;
  # }

  dimension_group: last_modified {
    # USED for WaterStreet data delivery
    hidden: no
    type: time
    timeframes: [date]
    sql: ${TABLE}.last_modified_date ;;
  }

  # dimension_group: last_transaction {
  #   # NOT USED
  #   hidden: yes
  #   type: time
  #   timeframes: [time, date, week, month]
  #   sql: ${TABLE}.last_transaction_date ;;
  # }

  # dimension: loss_address_id {
  #   # NOT USED
  #   hidden: yes
  #   type: number
  #   sql: ${TABLE}.loss_address_id ;;
  # }

  dimension_group: loss_date {
    type: time
    label: "Loss"
    timeframes: [date,week,quarter,year,month]
    sql: ${TABLE}.loss_date ;;
  }

  # dimension: loss_location {
  #   # NOT USED
  #   hidden: yes
  #   type: string
  #   label: "Location of Loss"
  #   sql: ${TABLE}.loss_location ;;
  # }

  # dimension: losstimegiven {
  #   type: string
  #   label: "Is Loss Time Given"
  #   sql: CASE WHEN ${TABLE}.losstimegiven=1 THEN 'Yes' ELSE 'No' END ;;
  # }

  # dimension: officer_badge_no {
  #   # NOT USED
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.officer_badge_no ;;
  # }

  # dimension_group: original_iso_loss {
  #   # NOT USED
  #   hidden: yes
  #   type: time
  #   timeframes: [date, week, month]
  #   convert_tz: no
  #   sql: ${TABLE}.original_iso_loss_date ;;
  # }

  # dimension: other_insurance_dscr {
  #   # NOT USED
  #   hidden: yes
  #   label: "Other Insurance Description"
  #   type: string
  #   sql: ${TABLE}.other_insurance_dscr ;;
  # }

  # dimension: outside_adjuster_id {
  #   # NOT USED
  #   hidden: yes
  #   type: number
  #   sql: ${TABLE}.outside_adjuster_id ;;
  # }

  # dimension: packagepart_num {
  #   # NOT USED
  #   hidden: yes
  #   type: number
  #   sql: ${TABLE}.packagepart_num ;;
  # }

  # dimension_group: pcadded {
  #   # USE Reported_Date
  #   hidden: yes
  #   type: time
  #   timeframes: [time, date, week, month]
  #   sql: ${TABLE}.pcadded_date ;;
  # }

  # dimension: police_case_no {
  #   # NOT USED
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.police_case_no ;;
  # }

  dimension: police_notified {
    type: string
    label: "Is Police Notified"
    sql: CASE WHEN ${TABLE}.police_notified=1  THEN 'Yes' ELSE 'No' END ;;
  }

  dimension: policy_id {
    type: number
    hidden: yes
    sql: ${TABLE}.policy_id ;;
  }

  # dimension: policyimage_num {
  #   # NOT USED
  #   hidden: yes
  #   type: number
  #   sql: ${TABLE}.policyimage_num ;;
  # }

  # dimension: previous_claim_number {
  #   # NOT USED
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.previous_claim_number ;;
  # }

  # dimension: previous_loss_indicator {
  #   # NOT USED
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.previous_loss_indicator ;;
  # }

  # dimension: previously_reported {
  #   hidden: yes
  #   type: yesno
  #   sql: case when ${TABLE}.previously_reported = 'true' then 'Yes' else 'No' end ;;
  # }

  # dimension: process_medical_bill {
  #   hidden: yes
  #   type: yesno
  #   sql: case when ${TABLE}.process_medical_bill = 'true' then 'Yes' else 'No' end ;;
  # }

  # dimension: reinsurance_claim_number {
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.reinsurance_claim_number ;;
  # }

  # dimension: related_treatment_dscr {
  #   hidden: yes
  #   label: "Related Treatment Description"
  #   type: string
  #   sql: ${TABLE}.related_treatment_dscr ;;
  # }

  dimension_group: reported_date {
    type: time
    label: "Reported"
    # SH 2019-12-18 TT294238 - Added "time" to the timeframe
    timeframes: [date,month,quarter,year,day_of_week,hour_of_day,time]
    sql: ${TABLE}.reported_date ;;
  }

  # dimension: reported_to_iso {
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.reported_to_iso ;;
  # }

  # dimension_group: reported_to_iso {
  #   hidden: yes
  #   type: time
  #   timeframes: [date, week, month]
  #   convert_tz: no
  #   sql: ${TABLE}.reported_to_iso_date ;;
  # }

  # dimension_group: reported_to_iso_last_submitted {
  #   hidden: yes
  #   type: time
  #   timeframes: [date, week, month]
  #   convert_tz: no
  #   sql: ${TABLE}.reported_to_iso_last_submitted_date ;;
  # }

  # dimension: reported_to_iso_update_claim {
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.reported_to_iso_update_claim ;;
  # }

  # dimension: request_claimsdirector_search {
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.request_claimsdirector_search ;;
  # }

  # dimension: single_vehicle_loss {
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.single_vehicle_loss ;;
  # }

  # dimension: siu_indicator {
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.siu_indicator ;;
  # }

  # dimension: submit_to_iso {
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.submit_to_iso ;;
  # }

  # dimension: update_iso_loss_date {
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.update_iso_loss_date ;;
  # }

  # dimension: violation_text {
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.violation_text ;;
  # }

  # dimension: waive_clue_reporting {
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.waive_clue_reporting ;;
  # }

  # dimension: xref_claimadjuster {
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.xref_claimadjuster ;;
  # }

  # dimension: xref_claimnumber {
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.xref_claimnumber ;;
  # }


  # BEGIN - CALCULATE DAYS TO CLOSE
  # dimension: days_to_close {
  #   hidden: yes
  #   label: "Days to Close"
  #   type: number
  #   sql: DateDiff(d,${reported_date_date},${CLOSEDATE}) ;;
  # }

  # dimension: days_to_close_tier {
  #   label: "Days to Close - Tier"
  #   type: tier
  #   style: integer
  #   tiers: [0, 31, 61, 91, 365]
  #   sql: ${days_to_close} ;;
  # }
  # END - CALCULATE DAYS TO CLOSE


#   dimension: open {
#     label: "Open"
#     type: date
#     sql: (
#             select added_date
#             from claimcontrolactivity
#             where claimcontrolactivity.claimcontrol_id = ${claimcontrol_id}
#               and claimcontrolactivity.num = 1
#           ) ;;
#   }

  measure: count {
    label: "Claim Count"
    type: count
    drill_fields: [claim_stat*]
    link: {
      label: "Sort by Claim Number"
      url: "{{ link }}&sorts=claim_control.claim_number"
      #url: "{{ link }}&sorts=order_items.sale_price+desc&limit=20"
    }
    link: {
      label: "Sort by Date Reported"
      url: "{{ link }}&sorts=claim_control.reported_date_date"
    }
    link: {
      label: "Sort by Loss Paid"
      url: "{{ link }}&sorts=v_claim_detail_feature.sum_indemnity_paid"
    }
    link: {
      label: "Sort by Reserve Amount"
      url: "{{ link }}&sorts=v_claim_detail_feature.sum_indemnity_reserve"
    }
    link: {
      label: "Sort by CAT Code"
      url: "{{ link }}&sorts=claim_catastrophe.user_code"
    }
  }

  measure: count_with_indemnity_paid {
    label: "Claim Count with Paid Loss"
    type: count
    drill_fields: [claim_stat*]
    filters: {
      field: v_claim_detail_feature.indemnity_paid
      value: ">0"
    }
  }

  #SH 2020-04-20 Add a new data point to help with MCAS 20 counts
  measure: count_without_indemnity_paid {
    label: "Claim Count without Paid Loss"
    type: count
    drill_fields: [claim_stat*]
    filters: {
      field: v_claim_detail_feature.indemnity_paid
      value: "=0"
    }
  }

  measure: count_with_expense_paid {
    label: "Claim Count with Paid Expense"
    type: count
    drill_fields: [claim_stat*]
    filters: {
      field: v_claim_detail_feature.expense_paid
      value: ">0"
    }
  }

  set: claim_stat {
    fields: [
      claim_control.claim_number,
      policy.current_policy,
      claim_control_status.dscr,
      claim_loss_type.dscr,
      claim_catastrophe.user_code,
      claim_type.dscr,
      claim_severity.dscr,
      claim_control.loss_date_date,
      claim_control.reported_date_date,
      dt_claim_days_open.days_open,
      dt_claim_close_date.claim_close_date_date,
      dt_claim_inside_adjuster.initials,
      dt_claim_supervisor.supervisor_initials,
      v_claim_detail_feature.sum_indemnity_paid,
      v_claim_detail_feature.sum_indemnity_reserve,
      v_claim_detail_feature.sum_expense_paid
    ]
  }

}
