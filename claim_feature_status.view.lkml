view: claim_feature_status {
  sql_table_name: dbo.ClaimFeatureStatus ;;

  dimension: claimfeaturestatus_id {
    type: number
    sql: ${TABLE}.claimfeaturestatus_id ;;
  }

  dimension: dscr {
    label: "Status"
    type: string
    sql: ${TABLE}.dscr ;;
  }

  dimension: enabled {
    hidden: yes
    type: string
    sql: ${TABLE}.enabled ;;
  }

  dimension_group: last_modified {
    hidden: yes
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified_date ;;
  }

  dimension_group: pcadded {
    hidden: yes
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.pcadded_date ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
