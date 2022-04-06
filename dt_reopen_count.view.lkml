view: dt_reopen_count {
  derived_table: {
    sql:
      --select cc.claimcontrol_id, (count(cc.claimcontrol_id)-1) as ReopenCount
      --from ClaimControl cc
      --  left outer join ClaimControlActivity cca on cc.claimcontrol_id = cca.claimcontrol_id
      --where cca.claimactivitycode_id = 1
      --group by cc.claimcontrol_id


      select cc.claimcontrol_id, (count(cc.claimcontrol_id)-1) as ReopenCount,
  (select Count(*)
  from ClaimControl cc1
    where cc1.claimcontrol_id = cc.claimcontrol_id) as OpenCount
      from ClaimControl cc
        left outer join ClaimControlActivity cca on cc.claimcontrol_id = cca.claimcontrol_id
      where cca.claimactivitycode_id = 1
      group by cc.claimcontrol_id
       ;;
  }

  dimension: claimcontrol_id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.claimcontrol_id ;;
  }

  dimension: reopen_count {
    label: "Reopen Count"
    type: number
    sql: ${TABLE}.ReopenCount ;;
  }

  dimension: open_count {
    hidden: yes
    type: number
    sql: ${TABLE}.openCount ;;
  }

  measure: sum_reopen_count  {
    hidden: yes
    type: sum
    sql: ${reopen_count} ;;
  }

  measure: sum_open_count  {
    hidden: yes
    type: sum
    sql: ${open_count} ;;
  }

  measure:  reopen_ratio {
    label: "Reopen Ratio"
    type:  number
    sql: case when ${sum_open_count} >0 then ${sum_reopen_count} / ${sum_open_count} else 0 end ;;
    value_format_name: percent_1
    drill_fields: [claim_stat*]
  }

  set: claim_stat {
    fields: [
      claim_control.claim_number,
      dt_reopen_count.reopen_count,
      claim_control_status.dscr,
      claim_loss_type.dscr,
      claim_type.dscr,
      claim_severity.dscr,
      claim_control.loss_date_date,
      claim_control.reported_date_date,
      dt_claim_days_open.days_open,
      dt_claim_close_date.claim_close_date_date,
      dt_claim_inside_adjuster.initials
    ]
  }

}
