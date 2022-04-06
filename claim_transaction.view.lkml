view: claim_transaction {
  sql_table_name: dbo.ClaimTransaction ;;

  dimension: compound_primary_key {
    type: string
    primary_key: yes
    hidden: yes
    sql: CONCAT(${claimcontrol_id},${claimant_num},${claimfeature_num},${claimtransaction_num}) ;;
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

  # dimension_group: added {
  #   hidden: yes
  #   type: time
  #   timeframes: [
  #     raw,
  #     date,
  #     week,
  #     month,
  #     quarter,
  #     year
  #   ]
  #   convert_tz: no
  #   datatype: date
  #   sql: ${TABLE}.added_date ;;
  # }

  # dimension: amount {
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.amount ;;
  # }

  # dimension: approved {
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.approved ;;
  # }

  # dimension_group: approved {
  #   hidden: yes
  #   type: time
  #   timeframes: [
  #     raw,
  #     time,
  #     date,
  #     week,
  #     month,
  #     quarter,
  #     year
  #   ]
  #   sql: ${TABLE}.approved_date ;;
  # }

  # dimension: approvedby_users_id {
  #   hidden: yes
  #   type: number
  #   sql: ${TABLE}.approvedby_users_id ;;
  # }

  # dimension: benefit {
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.benefit ;;
  # }

  # dimension_group: benefit_end {
  #   hidden: yes
  #   type: time
  #   timeframes: [
  #     raw,
  #     time,
  #     date,
  #     week,
  #     month,
  #     quarter,
  #     year
  #   ]
  #   sql: ${TABLE}.benefit_end ;;
  # }

  # dimension_group: benefit_start {
  #   hidden: yes
  #   type: time
  #   timeframes: [
  #     raw,
  #     time,
  #     date,
  #     week,
  #     month,
  #     quarter,
  #     year
  #   ]
  #   sql: ${TABLE}.benefit_start ;;
  # }

  # dimension: check_author {
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.check_author ;;
  # }

  # dimension_group: check_dt {
  #   hidden: no
  #   view_label: "Checks & Transactions"
  #   label: "Check"
  #   type: time
  #   timeframes: [date]
  #   sql: case when (${TABLE}.check_date > '1900-01-01') then ${TABLE}.check_date else NULL end  ;;
  # }

  # dimension: check_date {
  #   hidden: yes
  #   view_label: "Checks & Transactions"
  #   label: "Check Date"
  #   type: date
  #   sql: ${TABLE}.check_date ;;
  # }

  # dimension: check_number {
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.check_number ;;
  # }

  # dimension: check_possession {
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.check_possession ;;
  # }

  # dimension: checkitem_id {
  #   hidden: yes
  #   type: number
  #   sql: ${TABLE}.checkitem_id ;;
  # }

  # dimension: claimchecktype_id {
  #   hidden: yes
  #   type: number
  #   sql: ${TABLE}.claimchecktype_id ;;
  # }

  # dimension: claimpaymentformtype_id {
  #   hidden: yes
  #   type: number
  #   sql: ${TABLE}.claimpaymentformtype_id ;;
  # }

  dimension: claimpaytype_id {
    hidden: yes
    type: number
    sql: ${TABLE}.claimpaytype_id ;;
  }

  # dimension: claimrecoverytype_id {
  #   hidden: yes
  #   type: number
  #   sql: ${TABLE}.claimrecoverytype_id ;;
  # }

  # dimension: claimscheduledpaymentcycle_id {
  #   hidden: yes
  #   type: number
  #   sql: ${TABLE}.claimscheduledpaymentcycle_id ;;
  # }

  # dimension: claimstoppmt_id {
  #   hidden: yes
  #   type: number
  #   sql: ${TABLE}.claimstoppmt_id ;;
  # }

  # dimension: claimtransactioncategory_id {
  #   hidden: yes
  #   type: number
  #   sql: ${TABLE}.claimtransactioncategory_id ;;
  # }

  # dimension: claimtransactionsplit_num {
  #   hidden: yes
  #   type: number
  #   sql: ${TABLE}.claimtransactionsplit_num ;;
  # }

  dimension: claimtransactionstatus_id {
    hidden: yes
    type: number
    sql: ${TABLE}.claimtransactionstatus_id ;;
  }

  # dimension: claimtransactiontrackingcode_id {
  #   hidden: yes
  #   type: number
  #   sql: ${TABLE}.claimtransactiontrackingcode_id ;;
  # }

  dimension: claimtransactiontype_id {
    hidden: yes
    type: number
    sql: ${TABLE}.claimtransactiontype_id ;;
  }

  # dimension: claimtransactionvoidreason_id {
  #   hidden: yes
  #   type: number
  #   sql: ${TABLE}.claimtransactionvoidreason_id ;;
  # }

  # dimension: coinsurance_amount {
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.coinsurance_amount ;;
  # }

  # dimension: deductible_amount {
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.deductible_amount ;;
  # }

  # dimension: deductible_applied {
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.deductible_applied ;;
  # }

  # dimension_group: eff {
  #   hidden: yes
  #   type: time
  #   timeframes: [date]
  #   sql: ${TABLE}.eff_date ;;
  # }

  # dimension: enclosures {
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.enclosures ;;
  # }

  # dimension_group: invoice {
  #   hidden: yes
  #   type: time
  #   timeframes: [date]
  #   convert_tz: no
  #   datatype: date
  #   sql: ${TABLE}.invoice_date ;;
  # }

  # dimension: invoice_number {
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.invoice_number ;;
  # }

  # dimension: is_converted {
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.is_converted ;;
  # }

  # dimension_group: last_modified {
  #   hidden: yes
  #   type: time
  #   timeframes: [date]
  #   sql: ${TABLE}.last_modified_date ;;
  # }

  dimension: manual_check {
    hidden: no
    label: "Is Manual Check"
    type: string
    sql: case when ${TABLE}.manual_check=1 then 'Yes' else 'No' end ;;
  }

  dimension: memo {
    label: "Memo"
    type: string
    sql: ${TABLE}.memo ;;
  }

  # dimension: new_reserve {
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.new_reserve ;;
  # }

  # dimension: old_reserve {
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.old_reserve ;;
  # }

  # dimension: pay_to_the_order_of {
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.pay_to_the_order_of ;;
  # }

  # dimension_group: pcadded {
  #   hidden: yes
  #   type: time
  #   timeframes: [date]
  #   sql: ${TABLE}.pcadded_date ;;
  # }

  # dimension: processed_by_eod {
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.processed_by_eod ;;
  # }

  # dimension: reissued {
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.reissued ;;
  # }

  # dimension_group: reissued {
  #   hidden: yes
  #   type: time
  #   timeframes: [date]
  #   sql: ${TABLE}.reissued_date ;;
  # }

  # dimension: rejected {
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.rejected ;;
  # }

  # dimension_group: rejected {
  #   hidden: yes
  #   type: time
  #   timeframes: [date]
  #   sql: ${TABLE}.rejected_date ;;
  # }

  # dimension: rejectedby_users_id {
  #   hidden: yes
  #   type: number
  #   sql: ${TABLE}.rejectedby_users_id ;;
  # }

  # dimension: related_claimtransaction_num {
  #   hidden: yes
  #   type: number
  #   sql: ${TABLE}.related_claimtransaction_num ;;
  # }

  # dimension: remark {
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.remark ;;
  # }

  # dimension: should_reimburse_deductible {
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.should_reimburse_deductible ;;
  # }

  # dimension: system_generated {
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.system_generated ;;
  # }

  # dimension: target {
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.target ;;
  # }

  # dimension: total_amount {
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.total_amount ;;
  # }

  # dimension: users_id {
  #   hidden: yes
  #   type: number
  #   sql: ${TABLE}.users_id ;;
  # }

  # dimension: vendor_claim_type {
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.vendor_claim_type ;;
  # }

  dimension_group: void {
    label: "Void"
    type: time
    timeframes: [date,week,month,quarter,year]
    sql: case when ${TABLE}.voided_date < '1900-01-01' then NULL else ${TABLE}.voided_date end ;;
  }

  # measure: count {
  #   hidden: yes
  #   type: count
  #   drill_fields: []
  # }
}
