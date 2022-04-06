view: claim_office {
  sql_table_name: dbo.ClaimOffice ;;

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
    datatype: date
    sql: ${TABLE}.added_date ;;
  }

  dimension: claimoffice_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.claimoffice_id ;;
  }

  dimension: company_id {
    type: number
    sql: ${TABLE}.company_id ;;
  }

  dimension: default_office {
    type: string
    sql: ${TABLE}.default_office ;;
  }

  dimension: dscr {
    label: "Office"
    type: string
    sql: ${TABLE}.dscr ;;
  }

  dimension: enabled {
    type: string
    sql: ${TABLE}.enabled ;;
  }

  dimension: iso_office_code {
    type: string
    sql: ${TABLE}.iso_office_code ;;
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

  dimension: medicare_claimoffice_code {
    type: string
    sql: ${TABLE}.medicare_claimoffice_code ;;
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
    drill_fields: []
  }
}
