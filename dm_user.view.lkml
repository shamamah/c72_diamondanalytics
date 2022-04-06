view: dm_user {
  sql_table_name: dbo.User ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Id ;;
  }

  dimension_group: _inserted {
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
    sql: ${TABLE}._inserted ;;
  }

  dimension: active {
    type: string
    sql: ${TABLE}.Active ;;
  }

  dimension: branch_name {
    type: string
    sql: ${TABLE}.BranchName ;;
  }

  dimension: client_company_id {
    type: number
    sql: ${TABLE}.ClientCompanyID ;;
  }

  dimension: client_company_name {
    type: string
    sql: ${TABLE}.ClientCompanyName ;;
  }

  dimension: company_code {
    type: string
    sql: ${TABLE}.CompanyCode ;;
  }

  dimension: source_system {
    type: string
    sql: ${TABLE}.SourceSystem ;;
  }

  dimension: user_city {
    type: string
    sql: ${TABLE}.UserCity ;;
  }

  dimension: user_country {
    type: string
    sql: ${TABLE}.UserCountry ;;
  }

  dimension: user_fname {
    type: string
    sql: ${TABLE}.UserFName ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.UserID ;;
  }

  dimension: user_lname {
    type: string
    sql: ${TABLE}.UserLName ;;
  }

  dimension: user_state {
    type: string
    sql: ${TABLE}.UserState ;;
  }

  dimension: user_title {
    type: string
    sql: ${TABLE}.UserTitle ;;
  }

  dimension: user_zip {
    type: string
    sql: ${TABLE}.UserZIP ;;
  }

  measure: count {
    type: count
    drill_fields: [id, user_fname, user_lname, branch_name, client_company_name]
  }
}
