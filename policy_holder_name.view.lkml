view: policy_holder_name {
  label: "Policy Holder"
  sql_table_name: dbo.vName ;;

  dimension: name_id {
    hidden: yes
    primary_key: yes
    type: number
    sql: ${TABLE}.name_id ;;
  }

  dimension_group: birth {
    type: time
    timeframes: [date]
    sql: ${TABLE}.birth_date ;;
  }

  dimension: display_name {
    type: string
    sql: ${TABLE}.display_name ;;
  }

  dimension: dln {
    label: "Drivers License Number"
    type: string
    sql: ${TABLE}.dln ;;
  }

  dimension: first_name {
    label: "First Name"
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: last_name {
    label: "Last Name"
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: dlstate_id {
    hidden: yes
    type: number
    sql: ${TABLE}.dlstate_id ;;
  }

  dimension: maritalstatus_id {
    hidden: yes
    type: number
    sql: ${TABLE}.maritalstatus_id ;;
  }

  dimension: nametype_id {
    hidden: yes
    type: number
    sql: ${TABLE}.nametype_id ;;
  }

  dimension: sex_id {
    hidden: yes
    type: number
    sql: ${TABLE}.sex_id ;;
  }

  dimension: detailstatuscode_id {
    hidden: yes
    type: number
    sql: ${TABLE}.detailstatuscode_id ;;
  }
}
