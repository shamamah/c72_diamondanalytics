view: check_status {
  sql_table_name: dbo.CheckStatus ;;

  dimension: checkstatus_id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.checkstatus_id ;;
  }

  dimension: description {
    label: "Check Status"
    type: string
    sql: ${TABLE}.description ;;
  }

#   dimension_group: last_modified {
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}.last_modified_date ;;
#   }

#   dimension_group: pcadded {
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}.pcadded_date ;;
#   }

#   measure: count {
#     type: count
#     drill_fields: []
#   }
}
