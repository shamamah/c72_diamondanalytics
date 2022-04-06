view: additional_interest {
  sql_table_name: dbo.AdditionalInterest ;;

  dimension_group: added {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.added_date ;;
  }

  dimension: added_policyimage_num {
    type: number
    sql: ${TABLE}.added_policyimage_num ;;
  }

  dimension: additionalinterest_num {
    type: number
    sql: ${TABLE}.additionalinterest_num ;;
  }

  dimension: additionalinterestlist_id {
    type: number
    hidden: yes
    sql: ${TABLE}.additionalinterestlist_id ;;
  }

  dimension: additionalinteresttype_id {
    type: number
    hidden: yes
    sql: ${TABLE}.additionalinteresttype_id ;;
  }

  dimension: atima {
    type: string
    sql: case when ${TABLE}.atima = 'true' then 'Yes' else 'No' end;;
  }

  dimension: bill_to {
    hidden: yes
    type: string
    sql: case when ${TABLE}.bill_to = 'true' then 'Yes' else 'No' end ;;
  }

  dimension: deleted_policyimage_num {
    type: number
    hidden: yes
    sql: ${TABLE}.deleted_policyimage_num ;;
  }

  dimension: description {
    type: string
    hidden: yes
    sql: ${TABLE}.description ;;
  }

  dimension: detailstatuscode_id {
    type: number
    hidden: yes
    sql: ${TABLE}.detailstatuscode_id ;;
  }

  dimension: external_id {
    type: string
    hidden: yes
    sql: ${TABLE}.external_id ;;
  }

  dimension: has_waiver_of_subrogation {
    type: string
    sql: case when ${TABLE}.has_waiver_of_subrogation = 'true' then 'Yes' else 'No' end ;;
  }

  dimension: interestinproperty {
    hidden: yes
    type: string
    sql: ${TABLE}.interestinproperty ;;
  }

  dimension: isaoa {
    label: "Its Successors And/Or Assigns"
    type: string
    sql: case when ${TABLE}.isaoa = 'true' then 'Yes' else 'No' end;;
  }

  dimension_group: last_modified {
    type: time
    hidden: yes
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified_date ;;
  }

  dimension: loan_amount {
    type: string
    sql: ${TABLE}.loan_amount ;;
  }

  dimension: loan_number {
    type: string
    sql: ${TABLE}.loan_number ;;
  }

  dimension: other {
    hidden: yes
    type: string
    sql: ${TABLE}.other ;;
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

  dimension_group: trustagreement {
    type: time
    hidden: yes
    timeframes: [time, date, week, month]
    sql: ${TABLE}.trustagreement_date ;;
  }

  measure: count {
    type: count
    hidden: yes
    drill_fields: [policy.rewrittenfrom_policy_id]
  }
}
