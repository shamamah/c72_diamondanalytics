view: form {
  sql_table_name: dbo.Form ;;

  dimension: form_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.form_id ;;
  }

  dimension: active {
    type: string
    sql: ${TABLE}.active ;;
  }

  dimension: fixed {
    type: string
    sql: ${TABLE}.fixed ;;
  }

  dimension: form_description {
    type: string
    sql: ${TABLE}.form_description ;;
  }

  dimension: form_number {
    type: string
    sql: ${TABLE}.form_number ;;
  }

  dimension: formsortgroup_id {
    type: number
    sql: ${TABLE}.formsortgroup_id ;;
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

  dimension: legal_form_name {
    type: string
    sql: ${TABLE}.legal_form_name ;;
  }

  dimension: listondec {
    type: string
    sql: ${TABLE}.listondec ;;
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

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      form_id,
      legal_form_name,
      classification_type_version.count,
      coverage_code_version_form_link.count,
      coverage_form_link.count,
      form_version.count,
      inclusion_exclusion_scheduled_item_type_version.count,
      inclusion_exclusion_type_version.count,
      v_form_version.count,
      v_policy_forms.count,
      v_printing_form_coverages.count,
      v_printing_get_print_header.count,
      v_printing_personal_auto_forms.count,
      v_printing_personal_dwelling_fire_forms.count,
      v_printing_personal_home_forms.count,
      v_printing_personal_inland_marine_forms.count,
      v_printing_personal_umbrella_forms.count,
      v_printing_personal_watercraft_forms.count,
      v_printing_policy_forms_on_dec.count,
      workflow.count
    ]
  }
}
