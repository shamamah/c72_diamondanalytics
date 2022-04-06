view: claim_control_activity {
  sql_table_name: dbo.ClaimControlActivity ;;

  dimension: compound_primary_key {
    type: string
    primary_key: yes
    hidden: yes
    sql: CONCAT(${claimcontrol_id},${num}) ;;
  }

#   dimension_group: added {
#     hidden: yes
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
#     sql: ${TABLE}.added ;;
#   }

#   dimension_group: open {
#     label: "Open"
#     type: time
#     timeframes: [date,week,month,quarter,year]
#     convert_tz: no
#     datatype: date
#     sql: ${TABLE}.added_date ;;
#   }

  dimension: claimactivitycode_id {
    hidden: yes
    type: number
    sql: ${TABLE}.claimactivitycode_id ;;
  }

  dimension: claimcontrol_id {
    hidden: yes
    type: number
    sql: ${TABLE}.claimcontrol_id ;;
  }

#   dimension: claimpersonneltype_id {
#     hidden: yes
#     type: number
#     sql: ${TABLE}.claimpersonneltype_id ;;
#   }

  dimension: dscr {
    hidden: yes
    type: string
    label: "Description"
    sql: ${TABLE}.dscr ;;
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

  dimension: num {
    hidden: yes
    type: number
    sql: ${TABLE}.num ;;
  }

  dimension_group: : claim_open_Date {
    label: "Open"
    view_label: "Claim"
    type: time
    timeframes: [date,month,quarter,year]
    sql: ${TABLE}.pcadded_date ;;
  }

#   dimension_group: Claim_Close_Date {
#     label: "Close"
#     view_label: "Claim"
#     type: time
#     timeframes: [raw,time,date,week,month,quarter,year]
#     sql: ${TABLE}.pcadded_date ;;
#   }

  #   dimension: transfer_from_users_id {
#     type: number
#     sql: ${TABLE}.transfer_from_users_id ;;
#   }

#   dimension: transfer_to_users_id {
#     type: number
#     sql: ${TABLE}.transfer_to_users_id ;;
#   }

#   dimension: users_id {
#     type: number
#     sql: ${TABLE}.users_id ;;
#   }

#   measure: count {
#     label: "Activity Count"
#     view_label: "Claim"
#     type: count
#     drill_fields: [num, claimactivitycode_id, dscr]
#   }
}
