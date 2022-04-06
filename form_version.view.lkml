view: form_version {
  sql_table_name: dbo.FormVersion ;;

  dimension: agency_print_dependent {
    type: string
    sql: ${TABLE}.agency_print_dependent ;;
  }

  dimension: attach_rules_id {
    type: number
    sql: ${TABLE}.attach_rules_id ;;
  }

  dimension: can_email {
    type: string
    sql: ${TABLE}.can_email ;;
  }

  dimension: companystatelob_id {
    type: number
    sql: ${TABLE}.companystatelob_id ;;
  }

  dimension: create_elios_on_ai_delete {
    type: string
    sql: ${TABLE}.create_elios_on_ai_delete ;;
  }

  dimension_group: edition {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.edition_date ;;
  }

  dimension: edition_version {
    type: string
    sql: ${TABLE}.edition_version ;;
  }

  dimension: elios_ai_copy {
    type: string
    sql: ${TABLE}.elios_ai_copy ;;
  }

  dimension: excludefromdisplay {
    type: string
    sql: ${TABLE}.excludefromdisplay ;;
  }

  dimension: form_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.form_id ;;
  }

  dimension: formcategorytype_id {
    type: number
    sql: ${TABLE}.formcategorytype_id ;;
  }

  dimension: formversion_group {
    type: number
    sql: ${TABLE}.formversion_group ;;
  }

  dimension: formversion_id {
    type: number
    sql: ${TABLE}.formversion_id ;;
  }

  dimension: is_claim_form {
    type: string
    sql: ${TABLE}.is_claim_form ;;
  }

  dimension: is_esign_agent {
    type: string
    sql: ${TABLE}.is_esign_agent ;;
  }

  dimension: is_esign_insured {
    type: string
    sql: ${TABLE}.is_esign_insured ;;
  }

  dimension: is_esign_insured2 {
    type: string
    sql: ${TABLE}.is_esign_insured2 ;;
  }

  dimension_group: last_modified {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.last_modified_date ;;
  }

  dimension: manual_form {
    type: string
    sql: ${TABLE}.manual_form ;;
  }

  dimension: multiyearformtype_id {
    type: number
    sql: ${TABLE}.multiyearformtype_id ;;
  }

  dimension_group: new_effective {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.new_effective_date ;;
  }

  dimension_group: new_expiration {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.new_expiration_date ;;
  }

  dimension: new_formversion_id {
    type: number
    sql: ${TABLE}.new_formversion_id ;;
  }

  dimension: onetimenotificationformtype_id {
    type: number
    sql: ${TABLE}.onetimenotificationformtype_id ;;
  }

  dimension_group: pcadded {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.pcadded_date ;;
  }

  dimension: print_agency_copy {
    type: string
    sql: ${TABLE}.print_agency_copy ;;
  }

  dimension: print_ai_copy {
    type: string
    sql: ${TABLE}.print_ai_copy ;;
  }

  dimension: print_billto_copy {
    type: string
    sql: ${TABLE}.print_billto_copy ;;
  }

  dimension: print_claimant_copy {
    type: string
    sql: ${TABLE}.print_claimant_copy ;;
  }

  dimension: print_form {
    type: string
    sql: ${TABLE}.print_form ;;
  }

  dimension: print_ho_copy {
    type: string
    sql: ${TABLE}.print_ho_copy ;;
  }

  dimension: print_insured_copy {
    type: string
    sql: ${TABLE}.print_insured_copy ;;
  }

  dimension: print_once {
    type: string
    sql: ${TABLE}.print_once ;;
  }

  dimension: print_sp_copy {
    type: string
    sql: ${TABLE}.print_sp_copy ;;
  }

  dimension: print_thirdparty_copy {
    type: string
    sql: ${TABLE}.print_thirdparty_copy ;;
  }

  dimension: printformtype_id {
    type: number
    sql: ${TABLE}.printformtype_id ;;
  }

  dimension: printlocation_insured_agency {
    type: string
    sql: ${TABLE}.printlocation_insured_agency ;;
  }

  dimension: printlocation_insured_home {
    type: string
    sql: ${TABLE}.printlocation_insured_home ;;
  }

  dimension: printonceperpackage {
    type: string
    sql: ${TABLE}.printonceperpackage ;;
  }

  dimension: printtype_id {
    type: number
    sql: ${TABLE}.printtype_id ;;
  }

  dimension_group: ren_effective {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.ren_effective_date ;;
  }

  dimension_group: ren_expiration {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.ren_expiration_date ;;
  }

  dimension: reprint_policy_package_form {
    type: string
    sql: ${TABLE}.reprint_policy_package_form ;;
  }

  dimension: suppress_rules_id {
    type: number
    sql: ${TABLE}.suppress_rules_id ;;
  }

  measure: count {
    type: count
    drill_fields: [form.form_id, form.legal_form_name]
  }
}
