view: dm_claim_status {
  sql_table_name: dbo.ClaimStatus ;;

  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.Id ;;
  }

  dimension: claim_id {
    hidden: yes
    type: number
    sql: ${TABLE}.ClaimId ;;
  }

  dimension: supervisor_id {
    type: number
    sql: ${TABLE}.SupervisorID ;;
  }

  dimension: manager_id {
    type: number
    sql: ${TABLE}.ManagerID ;;
  }

  dimension: adjuster_id {
    type: number
    sql: ${TABLE}.AdjusterID ;;
  }

  dimension: claim_status {
    label: "Claim Status"
    type: string
    sql: ${TABLE}.ClClaimStatus ;;
  }

  dimension: serious_claim {
    label: "Is Serious"
    type: string
    sql: ${TABLE}.SeriousClaim ;;
  }

  dimension: in_litigation {
    label: "Is Represented"
    type: string
    sql: ${TABLE}.InLitigation ;;
  }

  dimension: _uuid {
    hidden: yes
    type: string
    sql: ${TABLE}._uuid ;;
  }

  dimension_group: _inserted {
    hidden: yes
    label: "Inserted"
    type: time
    timeframes: [date,month,quarter,year]
    sql: ${TABLE}._inserted ;;
  }

  dimension_group: _updated {
    hidden: yes
    label: "Update"
    type: time
    timeframes: [date,month,quarter,year]
    sql: ${TABLE}._Updated ;;
  }

  dimension: active {
    label: "Is Active"
    type: string
    sql: case when ${TABLE}.Active=1 then 'Yes' else 'No' end ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
