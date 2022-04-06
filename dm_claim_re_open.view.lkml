view: dm_claim_re_open {
  sql_table_name: dbo.ClaimReOpen ;;

  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.Id ;;
  }

  dimension: adjuster_id {
    hidden: yes
    type: number
    sql: ${TABLE}.AdjusterID ;;
  }

  dimension: internal_claim_id {
    hidden: yes
    type: number
    sql: ${TABLE}.InternalClaimId ;;
  }

  dimension: manager_id {
    hidden: yes
    type: number
    sql: ${TABLE}.ManagerID ;;
  }

  dimension: next_task {
    hidden: yes
    type: string
    sql: ${TABLE}.NextTask ;;
  }

  dimension_group: re_close {
    label: "Re-Close"
    type: time
    timeframes: [
      time,
      date,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.ReCloseDate ;;
  }

  dimension_group: re_open {
    label: "Re-Open"
    type: time
    timeframes: [
      time,
      date,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.ReOpenDate ;;
  }

  dimension: re_open_duration {
    label: "Re-Open Duration"
    type: number
    sql: ${TABLE}.ReOpenDuration ;;
  }

  dimension: re_open_num {
    label: "Re-Open Count"
    type: number
    sql: ${TABLE}.ReOpenNum ;;
  }

  dimension: supervisor_id {
    hidden: yes
    type: number
    sql: ${TABLE}.SupervisorID ;;
  }

#   measure: count {
#     type: count
#     drill_fields: [id]
#   }
}
