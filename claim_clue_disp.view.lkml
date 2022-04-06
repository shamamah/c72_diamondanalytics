view: claim_clue_disp {
  sql_table_name: dbo.ClaimClueDisp ;;

#   dimension: aplusvehicledispositiontype_id {
#     type: number
#     sql: ${TABLE}.aplusvehicledispositiontype_id ;;
#   }

  dimension: claimcluedisp_id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.claimcluedisp_id ;;
  }

#   dimension: cluedisp {
#     type: string
#     sql: ${TABLE}.cluedisp ;;
#   }

#   dimension: displayorder {
#     type: number
#     sql: ${TABLE}.displayorder ;;
#   }

  dimension: dscr {
    label: "Disposition"
    type: string
    sql: ${TABLE}.dscr ;;
  }

#   dimension: enabled {
#     type: string
#     sql: ${TABLE}.enabled ;;
#   }

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
