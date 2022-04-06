view: policy_underwriting {
  sql_table_name: dbo.PolicyUnderwriting ;;

  dimension_group: added {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.added_date ;;
  }

  dimension: detailstatuscode_id {
    type: number
    sql: ${TABLE}.detailstatuscode_id ;;
  }

  dimension_group: last_modified {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified_date ;;
  }

  dimension: packagepart_num {
    type: number
    sql: ${TABLE}.packagepart_num ;;
  }

  dimension_group: pcadded {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.pcadded_date ;;
  }

  dimension: policy_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.policy_id ;;
  }

  dimension: policyimage_num {
    type: number
    sql: ${TABLE}.policyimage_num ;;
  }

  dimension: policyunderwriting_answer {
    type: number
    sql: ${TABLE}.policyunderwriting_answer ;;
  }

  dimension: underwriting_response {
   type: yesno
  sql: ${policyunderwriting_answer} = 1 ;;
  }

  dimension: policyunderwriting_extanswer {
    type: string
    sql: ${TABLE}.policyunderwriting_extanswer ;;
  }

  dimension: policyunderwriting_extraanswer {
    type: string
    sql: ${TABLE}.policyunderwriting_extraanswer ;;
  }

  dimension: policyunderwriting_num {
    type: number
    sql: ${TABLE}.policyunderwriting_num ;;
  }

  dimension: policyunderwritinganswertype_id {
    type: number
    sql: ${TABLE}.policyunderwritinganswertype_id ;;
  }

  dimension: policyunderwritingcode_id {
    type: number
    sql: ${TABLE}.policyunderwritingcode_id ;;
  }

  dimension: policyunderwritingextraanswertype_id {
    type: number
    sql: ${TABLE}.policyunderwritingextraanswertype_id ;;
  }

  dimension: policyunderwritinglevel_id {
    type: number
    sql: ${TABLE}.policyunderwritinglevel_id ;;
  }

  dimension: policyunderwritingtab_id {
    type: number
    sql: ${TABLE}.policyunderwritingtab_id ;;
  }

  dimension_group: underwriter {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.underwriter_date ;;
  }

  dimension: underwriter_name {
    type: string
    sql: ${TABLE}.underwriter_name ;;
  }

  measure: count {
    type: count
    drill_fields: [underwriter_name, policy.rewrittenfrom_policy_id]
  }
}
