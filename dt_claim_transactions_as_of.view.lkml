view: dt_claim_transactions_as_of {
  derived_table: {
    sql:  SELECT cc.claimcontrol_id
          ,cc.policy_id
          ,cc.policyimage_num
          ,V.claimant_num
          ,V.claimfeature_num
          ,V.claimtransaction_num
          ,V.claimtransactiontype_id
          ,V.claimtransactionstatus_id
          ,V.calc
          ,V.indemnity_reserve
          ,V.indemnity_paid
          ,V.expense_reserve
          ,V.expense_paid
          ,V.expense_recovery
          ,V.alae_reserve
          ,V.alae_paid
          ,V.salvage
          ,V.subro
          ,V.eff_date
          ,V.added_date
          ,V.pcadded_date

            FROM dbo.ClaimControl CC (NOLOCK)
               LEFT OUTER JOIN dbo.vClaimTransactionPostedDateAsEffDate V (NOLOCK)
                    ON CC.claimcontrol_id = V.claimcontrol_id
              AND  V.eff_date > '1900-01-01'
              AND  {% condition as_of_date %} V.eff_date {% endcondition %}
             LEFT OUTER JOIN dbo.ClaimTransaction CT (NOLOCK)
                   ON V.claimcontrol_id = CT.claimcontrol_id
                          AND V.claimant_num = CT.claimant_num
                          AND V.claimfeature_num = CT.claimfeature_num
                          AND V.claimtransaction_num = CT.claimtransaction_num
                                        AND  V.claimtransactionstatus_id IN (1, 4, 7)

             LEFT OUTER JOIN dbo.ClaimTransactionType CTT (NOLOCK)
                   ON CT.claimtransactiontype_id = CTT.claimtransactiontype_id
                           AND CTT.adjust_financials = 0
      WHERE claimcontrolstatus_id IN (1, 2)
          ;;
  }

  filter: as_of_date {
    type: date
    hidden: no
    label: "As of Date"
  }

  dimension: compound_primary_key {
    type: string
    primary_key: yes
    hidden: yes
    sql: CONCAT(${claimcontrol_id},${claimant_num},${claimfeature_num},${claimtransaction_num},${policy_id},${policyimage_num}) ;;
  }

  dimension: policy_id {
    hidden: yes
    type: number
    sql: ${TABLE}.policy_id ;;
  }

  dimension: policyimage_num {
    hidden: yes
    type: number
    sql: ${TABLE}.policyimage_num ;;
  }

  dimension: claimcontrol_id {
    hidden: yes
    type: number
    sql: ${TABLE}.claimcontrol_id ;;
  }

  dimension: claimant_num {
    hidden: yes
    type: number
    sql: ${TABLE}.claimant_num ;;
  }

  dimension: claimfeature_num {
    hidden: yes
    type: number
    sql: ${TABLE}.claimfeature_num ;;
  }

  dimension: claimtransaction_num {
    hidden: yes
    type: number
    sql: ${TABLE}.claimtransaction_num ;;
  }

  dimension: claimtransactiontype_id {
    hidden: yes
    type: number
    sql: ${TABLE}.claimtransactiontype_id ;;
  }

  dimension: claimtransactionstatus_id {
    hidden: yes
    type: number
    sql: ${TABLE}.claimtransactionstatus_id ;;
  }

  dimension: calc {
    hidden: yes
    type: string
    sql: ${TABLE}.calc ;;
  }

  dimension: dim_indemnity_reserve {
    hidden: yes
    type: string
    sql: ${TABLE}.indemnity_reserve ;;
  }

  measure:  indemnity_reserve {
    label: "Loss Reserve"
    type: sum
    sql: ${dim_indemnity_reserve} ;;
    value_format_name: usd
    drill_fields: [detail*]
  }

  dimension: dim_indemnity_paid {
    hidden: yes
    type: string
    sql: ${TABLE}.indemnity_paid ;;
  }

  measure:  indemnity_paid {
    label: "Loss Paid"
    type: sum
    sql: ${dim_indemnity_paid} ;;
    value_format_name: usd
    drill_fields: [detail*]
  }

  #2019-11-06 SH added new measure
  measure:  indemnity_incurred {
    label: "Loss Incurred"
    type: sum
    sql: ${dim_indemnity_paid} + ${dim_indemnity_reserve};;
    value_format_name: usd
    drill_fields: [detail*]
  }

  dimension: dim_expense_reserve {
    hidden: yes
    type: string
    sql: ${TABLE}.expense_reserve ;;
  }

  measure:  expense_reserve {
    label: "AO Reserve"
    type: sum
    sql: ${dim_expense_reserve} ;;
    value_format_name: usd
    drill_fields: [detail*]
  }

  dimension: dim_expense_paid {
    hidden: yes
    type: string
    sql: ${TABLE}.expense_paid ;;
  }

  measure:  expense_paid {
    label: "AO Paid"
    type: sum
    sql: ${dim_expense_paid} ;;
    value_format_name: usd
    drill_fields: [detail*]
  }

  dimension: dim_expense_recovery {
    hidden: yes
    type: string
    sql: ${TABLE}.expense_recovery ;;
  }

  measure:  expense_recovery {
    #2019-11-06 SH Changed label
    #label: "Rein Expense Recovery"
    label: "AO Recovery"
    type: sum
    sql: ${dim_expense_recovery} ;;
    value_format_name: usd
    drill_fields: [detail*]
  }

  dimension: dim_alae_reserve {
    hidden: yes
    type: string
    sql: ${TABLE}.alae_reserve ;;
  }

  measure:  alae_reserve {
    label: "DCC Reserve"
    type: sum
    sql: ${dim_alae_reserve} ;;
    value_format_name: usd
    drill_fields: [detail*]
  }

  dimension: dim_alae_paid {
    hidden: yes
    type: string
    sql: ${TABLE}.alae_paid ;;
  }

  measure:  alae_paid {
    label: "DCC Paid"
    type: sum
    sql: ${dim_alae_paid} ;;
    value_format_name: usd
    drill_fields: [detail*]
  }

  #SH 2019-11-27 Added this measure to replace a calculation on the HO Loss Report
  measure:  lae_payments {
    label: "LAE Payments"
    type: sum
    sql: ${dim_expense_paid} + ${dim_alae_paid} ;;
    value_format_name: usd
    drill_fields: [detail*]
  }

  dimension: dim_salvage {
    hidden: yes
    type: string
    sql: ${TABLE}.salvage ;;
  }

  measure:  salvage {
    label: "Salvage"
    type: sum
    sql: ${dim_salvage} ;;
    value_format_name: usd
    drill_fields: [detail*]
  }

  dimension: dim_subro {
    hidden: yes
    type: string
    sql: ${TABLE}.subro ;;
  }

  measure:  subro {
    label: "Subro"
    type: sum
    sql: ${dim_subro} ;;
    value_format_name: usd
    drill_fields: [detail*]
  }

  dimension_group: eff_date {
    hidden: yes
    label: "As Of"
    type: time
    timeframes: [date]
    sql: ${TABLE}.eff_date ;;
  }

  dimension: added_date {
    hidden: yes
    type: date
    sql: ${TABLE}.added_date ;;
  }

  dimension_group: pcadded_date {
    hidden: yes
    type: time
    sql: ${TABLE}.pcadded_date ;;
  }

  set: detail {
    fields: [
      claim_control.claim_number,
      claimant_num,
      claimfeature_num,
      claimtransaction_num,
      eff_date_date,
      indemnity_reserve,
      indemnity_paid,
      expense_reserve,
      expense_paid,
      expense_recovery,
      alae_reserve,
      alae_paid,
      salvage,
      subro
    ]
  }
}
