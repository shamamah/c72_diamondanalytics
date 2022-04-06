view: policy_status_code {
  sql_table_name: dbo.PolicyStatusCode ;;

  dimension: description {
    label: "Status"
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: policystatuscode_id {
    hidden: yes
    type: number
    sql: ${TABLE}.policystatuscode_id ;;
  }

  dimension: status {
    hidden: yes
    type: string
    sql: ${TABLE}.status ;;
  }
}
