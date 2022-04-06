view: claim_loss_type {
  sql_table_name: dbo.ClaimLossType ;;

#   dimension: accident_code {
#     type: string
#     sql: ${TABLE}.accident_code ;;
#   }

  dimension: claimlosstype_id {
    label: "Loss Type Code"
    view_label: "Claim"
    primary_key: yes
    hidden: no
    type: number
    sql: ${TABLE}.claimlosstype_id ;;
  }

#   dimension: cluelosstype_id {
#     type: number
#     sql: ${TABLE}.cluelosstype_id ;;
#   }

#   dimension: copart_loss_code {
#     type: string
#     sql: ${TABLE}.copart_loss_code ;;
#   }

  dimension: dscr {
    label: "Loss Type"
    view_label: "Claim"
    type: string
    sql: ${TABLE}.dscr ;;
  }

#   dimension: exclude_from_stats {
#     type: string
#     sql: ${TABLE}.exclude_from_stats ;;
#   }

#   dimension: iaa_loss_code {
#     type: string
#     sql: ${TABLE}.iaa_loss_code ;;
#   }

#   dimension: vendor_loss_code {
#     type: string
#     sql: ${TABLE}.vendor_loss_code ;;
#   }

  measure: count {
    hidden: yes
    type: count
    drill_fields: []
  }
}
