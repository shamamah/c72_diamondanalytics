view: name {
  sql_table_name: dbo.Name ;;

  dimension: name_id {
    primary_key: yes
    type: number
    hidden: yes
    sql: ${TABLE}.name_id ;;
  }

  dimension: active_military {
    type: string
    hidden: yes
    sql: ${TABLE}.active_military ;;
  }

  dimension_group: added {
    type: time
    hidden: yes
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.added_date ;;
  }

  dimension: best_contact_time_details {
    type: string
    hidden: yes
    sql: ${TABLE}.best_contact_time_details ;;
  }

  dimension_group: birth {
    type: time
    hidden: yes
    timeframes: [time, date, week, month]
    sql: ${TABLE}.birth_date ;;
  }

  dimension: commercial_name1 {
    type: string
    hidden: yes
    sql: ${TABLE}.commercial_name1 ;;
  }

  dimension: commercial_name2 {
    type: string
    hidden: yes
    sql: ${TABLE}.commercial_name2 ;;
  }

  dimension: commercialweb {
    type: string
    hidden: yes
    sql: ${TABLE}.commercialweb ;;
  }

  dimension: contactreasontype_id {
    type: number
    hidden: yes
    sql: ${TABLE}.contactreasontype_id ;;
  }

  dimension: customer_encrypted_taxnum {
    type: string
    hidden: yes
    sql: ${TABLE}.customer_encrypted_taxnum ;;
  }

  dimension_group: date_business_started {
    type: time
    hidden: yes
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.date_business_started ;;
  }

  dimension: description_of_operations {
    type: string
    hidden: yes
    sql: ${TABLE}.description_of_operations ;;
  }

  dimension: detailstatuscode_id {
    type: number
    hidden: yes
    sql: ${TABLE}.detailstatuscode_id ;;
  }

  dimension: display_name {
    type: string
    sql: ${TABLE}.display_name ;;
  }

  dimension: dln {
    type: string
    hidden: yes
    sql: ${TABLE}.dln ;;
  }

  dimension_group: dln {
    type: time
    hidden: yes
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dln_date ;;
  }

  dimension: dlstate_id {
    type: number
    hidden: yes
    sql: ${TABLE}.dlstate_id ;;
  }

  dimension: doing_business_as {
    type: string
    hidden: yes
    sql: ${TABLE}.doing_business_as ;;
  }

  dimension: entitytype_id {
    type: number
    hidden: yes
    sql: ${TABLE}.entitytype_id ;;
  }

  dimension: first_name {
    type: string
    hidden: yes
    sql: ${TABLE}.first_name ;;
  }

  dimension: health_insurance_claim_number {
    type: string
    hidden: yes
    sql: ${TABLE}.health_insurance_claim_number ;;
  }

  dimension_group: last_modified {
    type: time
    hidden: yes
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified_date ;;
  }

  dimension: last_name {
    type: string
    hidden: yes
    sql: ${TABLE}.last_name ;;
  }

  dimension: lexis_nexis_identifier {
    type: number
    hidden: yes
    value_format_name: id
    sql: ${TABLE}.lexis_nexis_identifier ;;
  }

  dimension: maritalstatus_id {
    type: number
    hidden: yes
    sql: ${TABLE}.maritalstatus_id ;;
  }

  dimension: middle_name {
    type: string
    hidden: yes
    sql: ${TABLE}.middle_name ;;
  }

  dimension: naics_code {
    type: string
    hidden: yes
    sql: ${TABLE}.naics_code ;;
  }

  dimension: name_display_num {
    type: number
    hidden: yes
    sql: ${TABLE}.name_display_num ;;
  }

  dimension: name_num {
    type: number
    hidden: yes
    sql: ${TABLE}.name_num ;;
  }

  dimension: nameaddresssource_id {
    type: number
    hidden: yes
    sql: ${TABLE}.nameaddresssource_id ;;
  }

  dimension: nametype_id {
    type: number
    hidden: yes
    sql: ${TABLE}.nametype_id ;;
  }

  dimension: okay_to_call {
    type: string
    hidden: yes
    sql: ${TABLE}.okay_to_call ;;
  }

  dimension: okay_to_email {
    type: string
    hidden: yes
    sql: ${TABLE}.okay_to_email ;;
  }

  dimension: okay_to_text {
    type: string
    hidden: yes
    sql: ${TABLE}.okay_to_text ;;
  }

  dimension: other_legal_entity_description {
    type: string
    hidden: yes
    sql: ${TABLE}.other_legal_entity_description ;;
  }

  dimension: packagepart_num {
    type: number
    hidden: yes
    sql: ${TABLE}.packagepart_num ;;
  }

  dimension_group: pcadded {
    type: time
    hidden: yes
    timeframes: [time, date, week, month]
    sql: ${TABLE}.pcadded_date ;;
  }

  dimension: policy_id {
    type: number
    hidden: yes
    sql: ${TABLE}.policy_id ;;
  }

  dimension: policyimage_num {
    type: number
    hidden: yes
    sql: ${TABLE}.policyimage_num ;;
  }

  dimension: position_title {
    type: string
    hidden: yes
    sql: ${TABLE}.position_title ;;
  }

  dimension: prefix_name {
    type: string
    hidden: yes
    sql: ${TABLE}.prefix_name ;;
  }

  dimension: riskgradelookup_id {
    type: number
    hidden: yes
    sql: ${TABLE}.riskgradelookup_id ;;
  }

  dimension: salutation {
    type: string
    hidden: yes
    sql: ${TABLE}.salutation ;;
  }

  dimension: sex_id {
    type: number
    hidden: yes
    sql: ${TABLE}.sex_id ;;
  }

  dimension: sic_code {
    type: string
    hidden: yes
    sql: ${TABLE}.sic_code ;;
  }

  dimension: sort_name {
    type: string
    hidden: yes
    sql: ${TABLE}.sort_name ;;
  }

  dimension: suffix_name {
    type: string
    hidden: yes
    sql: ${TABLE}.suffix_name ;;
  }

  dimension: taxnum {
    type: string
    hidden: yes
    sql: ${TABLE}.taxnum ;;
  }

  dimension: taxtype_id {
    type: number
    hidden: yes
    sql: ${TABLE}.taxtype_id ;;
  }

  dimension: thirdparty_entity_id {
    type: number
    hidden: yes
    sql: ${TABLE}.thirdparty_entity_id ;;
  }

  dimension: thirdparty_group_id {
    type: number
    hidden: yes
    sql: ${TABLE}.thirdparty_group_id ;;
  }

  dimension: vendor_birth_date_changed {
    type: string
    hidden: yes
    sql: ${TABLE}.vendor_birth_date_changed ;;
  }

  dimension: vendor_dln_changed {
    type: string
    hidden: yes
    sql: ${TABLE}.vendor_dln_changed ;;
  }

  dimension: vendor_taxnum_changed {
    type: string
    hidden: yes
    sql: ${TABLE}.vendor_taxnum_changed ;;
  }

  dimension: years_experience {
    type: number
    hidden: yes
    sql: ${TABLE}.years_experience ;;
  }

  measure: count {
    type: count
    hidden: yes
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      name_id,
      display_name,
      sort_name,
      prefix_name,
      first_name,
      middle_name,
      last_name,
      suffix_name,
      policy.rewrittenfrom_policy_id,
      sex.sex_id,
      accounting_agency_receipts.count,
      accounting_pay_queue.count,
      accounting_suspended_cash.count,
      acdappraisal_estimate_name_link.count,
      additional_insured_name_link.count,
      additional_interest_list_name_link.count,
      additional_location_name_link.count,
      agency_name_link.count,
      agency_other_carrier_name_link.count,
      agency_producer_name_link.count,
      aplus_result_name_link.count,
      applicant_name_link.count,
      bank_account.count,
      billing_account_name_link.count,
      billing_cash_credit_card.count,
      check_payee.count,
      claimant_medicare_info_name_link.count,
      claimant_name_link.count,
      claim_appraiser_name_link.count,
      claim_attorney.count,
      claim_care_provider_name_link.count,
      claim_carrier_adjuster_name_link.count,
      claim_carrier_name_link.count,
      claim_contact_name_link.count,
      claim_contractor_name_link.count,
      claim_control_name_link.count,
      claim_control_property_ainame_link.count,
      claim_control_vehicle_ainame_link.count,
      claim_control_vehicle_name_link.count,
      claim_feature_name_link.count,
      claim_fire_dept_name_link.count,
      claim_firm_attorney_name_link.count,
      claim_firm_name_link.count,
      claim_ln3rd_party_name_link.count,
      claim_ln_feature_name_link.count,
      claim_ln_image_name_link.count,
      claim_ln_property_ainame_link.count,
      claim_ln_reported_by.count,
      claim_ln_vehicle_ainame_link.count,
      claim_ln_vehicle_salvage_name_link.count,
      claim_ln_witness_name_link.count,
      claim_office_name_link.count,
      claim_payee.count,
      claim_payee_name_link.count,
      claim_police_dept_name_link.count,
      claim_police_officer_name_link.count,
      claim_repair_shop_name_link.count,
      claim_witness_name_link.count,
      client_name_link.count,
      company_name_link.count,
      contact_information_name_link.count,
      contact_name_link.count,
      credit_card_billing_account.count,
      credit_card_data.count,
      driver_name_link.count,
      employee.count,
      employment_name_link.count,
      fraud_prevention_restricted_entity.count,
      glclassification_name_link.count,
      home_based_business_ainame_link.count,
      home_based_business_name_link.count,
      important_notice_name_link.count,
      inclusion_exclusion_scheduled_item_name_link.count,
      inland_marine_coverage_name_link.count,
      insurance_score_name_link.count,
      location_name_link.count,
      location_personal_liability_name_link.count,
      location_resident_name_link.count,
      medical_facility_name_link.count,
      medical_provider_name_link.count,
      multiple_carrier_insurance_name_link.count,
      operator_employment_name_link.count,
      operator_name_link.count,
      optional_liability_name_link.count,
      other_carrier_name_link.count,
      other_members_household_name_link.count,
      outside_auditor_name_link.count,
      payroll_deduction_employer.count,
      policy_image_name_link.count,
      policy_info_name_link.count,
      print_batch_temp.count,
      print_job.count,
      prior_carrier_name_link.count,
      reinsurance_company_broker_name_link.count,
      rvwatercraft_other_owner_name_link.count,
      section_coverage_name_link.count,
      student_away_at_school_name_link.count,
      suspense_account.count,
      tax_code_kycheck_payee.count,
      third_party_designee_name_link.count,
      trustee_name_link.count,
      trust_name_link.count,
      users.count,
      v_accounting_company_state_lobagency.count,
      v_agency_producer.count,
      v_ailist.count,
      v_applicant.count,
      v_applicant2.count,
      v_applicant_inland.count,
      v_billing_cash.count,
      v_claim_transaction_payee_info.count,
      v_claim_transaction_payees.count,
      v_company.count,
      v_company_state_lobagency.count,
      v_diadmin_agency_other_carrier.count,
      v_diadmin_agency_producer.count,
      v_diadmin_company.count,
      v_driver.count,
      v_driver_employment.count,
      v_driver_name.count,
      v_employment.count,
      v_home_based_business.count,
      v_home_based_business_ai.count,
      v_important_notice.count,
      v_location_name.count,
      v_name.count,
      v_name_udt.count,
      v_operator.count,
      v_other_members_household.count,
      v_suspense_cash_balance.count,
      v_third_party_designee.count,
      v_user_name.count,
      v_users.count,
      v_write_letter_policy_name_address.count,
      v_xml_driver_name.count,
      v_xml_operator_name.count
    ]
  }
}
