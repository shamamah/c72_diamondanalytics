view: dt_claim_days_open {
  derived_table: {
    sql: SELECT CC.claimcontrol_id,
       CC.claim_number,
       CCA_Open.added AS open_date,
       ISNULL(CCA_Closed.added, GetDate()) AS close_date,
       DATEDIFF_BIG(dd,CCA_Open.added,ISNULL(CCA_Closed.added, GetDate())) as days_open
FROM dbo.ClaimControl CC (NOLOCK)
INNER JOIN dbo.ClaimControlActivity CCA_Open (NOLOCK)
       ON CC.claimcontrol_id = CCA_Open.claimcontrol_id
              AND CCA_Open.num = (SELECT MIN(num)
                                     FROM dbo.ClaimControlActivity CCA1 (NOLOCK)
                                     WHERE CCA1.claimcontrol_id = CC.claimcontrol_id
                                                AND CCA1.claimactivitycode_id = 1)
LEFT OUTER JOIN dbo.ClaimControlActivity CCA_Closed(NOLOCK)
       ON CC.claimcontrol_id = CCA_Closed.claimcontrol_id
              AND CCA_Closed.num = (SELECT MIN(num)
                                     FROM dbo.ClaimControlActivity CCA2 (NOLOCK)
                                     WHERE CCA2.claimcontrol_id = CC.claimcontrol_id
                                                AND CCA2.claimactivitycode_id = 2)
 ;;
  }

  dimension: claimcontrol_id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.claimcontrol_id ;;
  }

  dimension: claim_number {
    hidden: yes
    type: string
    sql: ${TABLE}.claim_number ;;
  }

  dimension_group: open_date {
    hidden: yes
    type: time
    sql: ${TABLE}.open_date ;;
  }

  dimension_group: close_date {
    hidden: yes
    type: time
    sql: ${TABLE}.close_date ;;
  }

#   dimension: days_open {
#     label: "Days Open"
#     type: number
#     sql: ${TABLE}.days_open ;;
#   }
#
#   dimension : closed_within {
#     type: tier
#     label: "Closed Within (Tiers)"
#     tiers: [31,61,91]
#     style: integer
#     sql: ${days_open} ;;
#     value_format: "0"
#   }
#
#   dimension : days_open_tier {
#     type: tier
#     label: "Days Open (Tiers)"
#     tiers: [31,61,91]
#     style: integer
#     sql: ${days_open} ;;
#     value_format: "0"
#   }

  measure: count {
    hidden:yes
    type: count
  }

#   measure: sum_days_open {
#     hidden:yes
#     type: sum
#     label: "Total Days Open"
#     sql:  ${days_open}  ;;
#     value_format: "0"
#   }
#
#   measure: average_days_to_close {
#     type: average
#     label: "Average Days To Close"
#     sql:  ${days_open}  ;;
#     value_format: "0"
#     drill_fields: [claim_stat*]
#   }

  set: claim_stat {
    fields: [
      claim_number,
      claim_control_status.dscr,
      claim_loss_type.dscr,
      claim_type.dscr,
      claim_severity.dscr,
      claim_control.loss_date_date,
      claim_control.reported_date_date,
      dt_claim_days_open.days_open,
      dt_claim_close_date.claim_close_date_date,
      dt_claim_inside_adjuster.initials,
      v_claim_detail_feature.sum_indemnity_paid
    ]
  }

}
