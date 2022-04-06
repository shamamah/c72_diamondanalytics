view: policy_form {
  sql_table_name: dbo.PolicyForm ;;

  dimension_group: added {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    sql: ${TABLE}.added_date ;;
  }

  dimension: attachment_reason {
    type: string
    sql: ${TABLE}.attachment_reason ;;
  }

  dimension: detailstatuscode_id {
    type: number
    sql: ${TABLE}.detailstatuscode_id ;;
  }

  dimension: formversion_id {
    type: number
    sql: ${TABLE}.formversion_id ;;
  }

  dimension: immediateformtype_id {
    type: number
    sql: ${TABLE}.immediateformtype_id ;;
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

  dimension: newform {
    type: string
    sql: ${TABLE}.newform ;;
  }

  dimension: packagepart_num {
    type: number
    sql: ${TABLE}.packagepart_num ;;
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

  dimension: policy_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.policy_id ;;
  }

  dimension: policyform_num {
    type: number
    sql: ${TABLE}.policyform_num ;;
  }

  dimension: policyimage_num {
    type: number
    sql: ${TABLE}.policyimage_num ;;
  }

  dimension: printxml_id {
    type: number
    sql: ${TABLE}.printxml_id ;;
  }

  dimension: processed {
    type: string
    sql: ${TABLE}.processed ;;
  }

  dimension: suppress_print {
    type: string
    sql: ${TABLE}.suppress_print ;;
  }

  dimension: suppress_xml {
    type: string
    sql: ${TABLE}.suppress_xml ;;
  }

  dimension: users_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.users_id ;;
  }

  measure: count {
    type: count
    drill_fields: [policy.rewrittenfrom_policy_id, users.users_id, users.login_name]
  }
}
