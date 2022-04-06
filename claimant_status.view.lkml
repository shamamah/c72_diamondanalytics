view: claimant_status {
  sql_table_name: dbo.ClaimantStatus ;;

  dimension: claimantstatus_id {
    type: number
    hidden:  yes
    sql: ${TABLE}.claimantstatus_id ;;
  }

  dimension: dscr {
    label: "Status"
    type: string
    sql: ${TABLE}.dscr ;;
  }

  dimension: enabled {
    type: string
    hidden:  yes
    sql: ${TABLE}.enabled ;;
  }

  dimension_group: last_modified {
    type: time
    timeframes: [time, date, week, month]
    hidden:  yes
    sql: ${TABLE}.last_modified_date ;;
  }

  dimension_group: pcadded {
    type: time
    timeframes: [time, date, week, month]
    hidden:  yes
    sql: ${TABLE}.pcadded_date ;;
  }

  measure: count {
    type: count
    hidden:  yes
    drill_fields: []
  }
}
