view: dt_summarized_claim_level_financials {
  derived_table: {
    sql: select v.claimcontrol_id
        ,sum(v.initial_indemnity_reserve) as initial_indemnity_reserve
        ,sum(v.indemnity_reserve) as indemnity_reserve
        ,sum(v.indemnity_paid) as indemnity_paid
        ,sum(v.initial_expense_reserve) as initial_expense_reserve
        ,sum(v.expense_reserve) as expense_reserve
        ,sum(v.expense_paid) as expense_paid
        ,sum(v.alae_reserve) as alae_reserve
        ,sum(v.alae_paid) as alae_paid
        ,sum(v.initial_anticipated_expense_recovery) as initial_anticipated_expense_recovery
        ,sum(v.anticipated_expense_recovery) as anticipated_expense_recovery
        ,sum(v.expense_recovery) as expense_recovery
        ,sum(v.initial_anticipated_salvage) as initial_anticipated_salvage
        ,sum(v.anticipated_salvage) as anticipated_salvage
        ,sum(v.salvage) as salvage
        ,sum(v.initial_anticipated_subro) as initial_anticipated_subro
        ,sum(v.anticipated_subro) as anticipated_subro
        ,sum(v.subro) as subro
        ,sum(v.initial_anticipated_other_recovery) as initial_anticipated_other_recovery
        ,sum(v.anticipated_other_recovery) as anticipated_other_recovery
        ,sum(v.other_recovery) as other_recovery
      from vClaimDetail_Feature v
      group by v.claimcontrol_id
       ;;
  }

  dimension: claimcontrol_id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.claimcontrol_id ;;
  }

  dimension: initial_indemnity_reserve {
    hidden: yes
    type: number
    sql: ${TABLE}.initial_indemnity_reserve ;;
  }

  dimension: indemnity_reserve {
    hidden: yes
    type: number
    sql: ${TABLE}.indemnity_reserve ;;
  }

  measure: sum_loss_reserve {
    label: "Total Loss Reserve"
    type: sum
    sql: ${indemnity_reserve} ;;
    value_format_name: usd
    drill_fields: [detail*]
  }

  measure: ave_loss_reserve {
    label: "Average Loss Reserve"
    type: average
    sql: ${indemnity_reserve} ;;
    value_format_name: usd
    filters: {
      field: indemnity_reserve
      value: ">0"
    }
    drill_fields: [detail*]
  }

  dimension: indemnity_paid {
    hidden: yes
    type: number
    sql: ${TABLE}.indemnity_paid ;;
  }

  measure: sum_loss_paid {
    label: "Total Loss Paid"
    type: sum
    sql: ${indemnity_paid} ;;
    value_format_name: usd
    drill_fields: [detail*]
  }

  measure: ave_loss_paid {
    label: "Average Loss Paid"
    type: average
    sql: ${indemnity_paid} ;;
    value_format_name: usd
    filters: {
      field: indemnity_paid
      value: ">0"
    }
    drill_fields: [detail*]
  }

  dimension: initial_expense_reserve {
    hidden: yes
    type: number
    sql: ${TABLE}.initial_expense_reserve ;;
  }

  dimension: expense_reserve {
    hidden: yes
    type: number
    sql: ${TABLE}.expense_reserve ;;
  }

  measure: sum_expense_reserve {
    label: "Total AO Reserve"
    type: sum
    sql: ${expense_reserve} ;;
    value_format_name: usd
    drill_fields: [detail*]
  }

  measure: ave_expense_reserve {
    label: "Average AO Reserve"
    type: average
    sql: ${expense_reserve} ;;
    value_format_name: usd
    filters: {
      field: expense_reserve
      value: ">0"
    }
    drill_fields: [detail*]
  }

  dimension: expense_paid {
    hidden: yes
    type: number
    sql: ${TABLE}.expense_paid ;;
  }

  measure: sum_expense_paid {
    label: "Total AO Paid"
    type: sum
    sql: ${expense_paid} ;;
    value_format_name: usd
    drill_fields: [detail*]
  }

  measure: ave_expense_paid {
    label: "Average AO Paid"
    type: average
    sql: ${expense_paid} ;;
    value_format_name: usd
    filters: {
      field: expense_paid
      value: ">0"
    }
    drill_fields: [detail*]
  }

  dimension: alae_reserve {
    hidden: yes
    type: number
    sql: ${TABLE}.alae_reserve ;;
  }

  measure: sum_alae_reserve {
    label: "Total DCC Reserve"
    type: sum
    sql: ${alae_reserve} ;;
    value_format_name: usd
    drill_fields: [detail*]
  }

  measure: ave_alae_reserve {
    label: "Average DCC Reserve"
    type: average
    sql: ${alae_reserve} ;;
    value_format_name: usd
    filters: {
      field: alae_reserve
      value: ">0"
    }
    drill_fields: [detail*]
  }

  dimension: alae_paid {
    hidden: yes
    type: number
    sql: ${TABLE}.alae_paid ;;
  }

  measure: sum_alae_paid {
    label: "Total DCC Paid"
    type: sum
    sql: ${alae_paid} ;;
    value_format_name: usd
    drill_fields: [detail*]
  }

  measure: ave_alae_paid {
    label: "Average DCC Paid"
    type: average
    sql: ${alae_paid} ;;
    value_format_name: usd
    filters: {
      field: alae_paid
      value: ">0"
    }
    drill_fields: [detail*]
  }

  dimension: initial_anticipated_expense_recovery {
    hidden: yes
    type: number
    sql: ${TABLE}.initial_anticipated_expense_recovery ;;
  }

  dimension: anticipated_expense_recovery {
    hidden: yes
    type: number
    sql: ${TABLE}.anticipated_expense_recovery ;;
  }

  dimension: expense_recovery {
    hidden: yes
    type: number
    sql: ${TABLE}.expense_recovery ;;
  }

  dimension: initial_anticipated_salvage {
    hidden: yes
    type: number
    sql: ${TABLE}.initial_anticipated_salvage ;;
  }

  dimension: anticipated_salvage {
    hidden: yes
    type: number
    sql: ${TABLE}.anticipated_salvage ;;
  }

  dimension: salvage {
    hidden: yes
    type: number
    sql: ${TABLE}.salvage ;;
  }

  measure: sum_salvage {
    label: "Total Salvage"
    type: sum
    sql: ${salvage} ;;
    value_format_name: usd
    drill_fields: [detail*]
  }

  measure: ave_salvage {
    label: "Average Salvage"
    type: average
    sql: ${salvage} ;;
    value_format_name: usd
    filters: {
      field: salvage
      value: ">0"
    }
    drill_fields: [detail*]
  }

  dimension: initial_anticipated_subro {
    hidden: yes
    type: number
    sql: ${TABLE}.initial_anticipated_subro ;;
  }

  dimension: anticipated_subro {
    hidden: yes
    type: number
    sql: ${TABLE}.anticipated_subro ;;
  }

  dimension: subro {
    hidden: yes
    type: number
    sql: ${TABLE}.subro ;;
  }

  measure: sum_subro {
    label: "Total Subro"
    type: sum
    sql: ${subro} ;;
    value_format_name: usd
    drill_fields: [detail*]
  }

  measure: ave_subro {
    label: "Average Subro"
    type: average
    sql: ${subro} ;;
    value_format_name: usd
    filters: {
      field: subro
      value: ">0"
    }
    drill_fields: [detail*]
  }

  dimension: initial_anticipated_other_recovery {
    hidden: yes
    type: number
    sql: ${TABLE}.initial_anticipated_other_recovery ;;
  }

  dimension: anticipated_other_recovery {
    hidden: yes
    type: number
    sql: ${TABLE}.anticipated_other_recovery ;;
  }

  dimension: other_recovery {
    hidden: yes
    type: number
    sql: ${TABLE}.other_recovery ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      claim_control.claim_number,
      #sum_initial_indemnity_reserve,
      sum_loss_reserve,
      ave_loss_reserve,
      sum_loss_paid,
      ave_loss_paid,
      #sum_initial_expense_reserve,
      sum_expense_reserve,
      ave_expense_reserve,
      sum_expense_paid,
      ave_expense_paid,
      sum_alae_reserve,
      ave_alae_reserve,
      sum_alae_paid,
      ave_alae_paid,
      #sum_initial_anticipated_expense_recovery,
      #sum_anticipated_expense_recovery,
      #sum_expense_recovery,
      #sum_initial_anticipated_salvage,
      #sum_anticipated_salvage,
      sum_salvage,
      ave_salvage,
      #sum_initial_anticipated_subro,
      #sum_anticipated_subro,
      sum_subro,
      ave_subro,
      #sum_initial_anticipated_other_recovery,
      #sum_anticipated_other_recovery,
      #sum_other_recovery
    ]
  }
}
