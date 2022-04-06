view: current_status {
  label: "Policy Status"
  sql_table_name: dbo.PolicyCurrentStatus ;;

  dimension: description {
    label: "Current Status"
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: non_archive_cancel_status {
    hidden: yes
    type: string
    sql: CASE
        WHEN ${description} in ('In-Force','Future') THEN 'Yes'
        ELSE 'No'
        END ;;
  }

  dimension: policycurrentstatus_id {
    hidden: yes
    type: number
    sql: ${TABLE}.policycurrentstatus_id ;;
  }
}
