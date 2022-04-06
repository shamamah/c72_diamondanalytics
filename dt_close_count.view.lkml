view: dt_close_count {
  derived_table: {
    sql: select count(cc.claimcontrol_id) as CloseCount, cc.claimcontrol_id
      from ClaimControl cc
        left outer join ClaimControlActivity cca on cc.claimcontrol_id = cca.claimcontrol_id
      where cca.claimactivitycode_id = 2
      group by cc.claimcontrol_id
        ;;
  }

  dimension: claimcontrol_id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.claimcontrol_id ;;
  }

  dimension: close_count {
    label: "Close Count"
    view_label: "Claim"
    type: number
    sql: ${TABLE}.CloseCount ;;
  }

#   measure: ratio  {
#     label: "Close Ratio"
#     view_label: "Claim"
#     type: number
#     sql: ${close_count} / ${claim_control.count}  ;;
#     value_format_name: percent_1
#   }
}
