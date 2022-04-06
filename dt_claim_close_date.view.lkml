view: dt_claim_close_date {
  derived_table: {
    sql: select cca.claimcontrol_id, max(cca.pcadded_date) as claim_close_date, min(cca.pcadded_date) as claim_initial_close_date
      from ClaimControlActivity cca
    where cca.claimactivitycode_id = 2
    group by cca.claimcontrol_id
    ;;
  }

  dimension: claimcontrol_id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.claimcontrol_id ;;
  }

  dimension_group: claim_close_date {
    label: "Close"
    type: time
    timeframes: [date,month,quarter,year]
    sql: ${TABLE}.claim_close_date ;;
  }

#   dimension_group: claim_initial_close_date {
#     label: "Initial Close"
#     type: time
#     timeframes: [date,month,quarter,year]
#     sql: ${TABLE}.claim_initial_close_date ;;
#   }
}
