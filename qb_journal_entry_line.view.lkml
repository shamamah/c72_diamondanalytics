view: qb_journal_entry_line {
  sql_table_name: qb.JournalEntryLine ;;

  dimension: fqprimary_key {
    primary_key: yes
    label: "zFQ Primary Key"
    type: string
    sql: ${TABLE}.FQPrimaryKey ;;
  }

  dimension: company_code {
    label: "zCompany Code"
    type: string
    sql: ${TABLE}.CompanyCode ;;
  }

  dimension: edit_sequence {
    label: "zEdit Sequence"
    type: string
    sql: ${TABLE}.EditSequence ;;
  }

  dimension: fqtransaction_link_key {
    label: "zFQ Transaction Key"
    type: string
    sql: ${TABLE}.FQTransactionLinkKey ;;
  }

  dimension: is_adjustment {
    label: "zIs Adjustment"
    type: string
    sql: ${TABLE}.IsAdjustment ;;
  }

  dimension: journal_line_account_ref_full_name {
    label: "Account Ref Full Name"
    type: string
    sql: ${TABLE}.JournalLineAccountRefFullName ;;
  }

  dimension: journal_line_account_ref_list_id {
    label: "zAccount Ref List ID"
    type: string
    sql: ${TABLE}.JournalLineAccountRefListID ;;
  }

  dimension: dim_journal_line_amount {
    label: "Line Amount"
    hidden: yes
    type: number
    value_format_name: usd
    sql: ${TABLE}.JournalLineAmount ;;
  }

  measure: journal_line_amount  {
    label: "Amount"
    type: sum
    value_format_name: usd
    sql: ${dim_journal_line_amount} ;;
  }

  dimension: journal_line_billable_status {
    label: "zBillable Status"
    type: string
    sql: ${TABLE}.JournalLineBillableStatus ;;
  }

  dimension: journal_line_class_ref_full_name {
    label: "Class Ref Full Name"
    type: string
    sql: ${TABLE}.JournalLineClassRefFullName ;;
  }

  dimension: journal_line_class_ref_list_id {
    label: "zClass Ref List ID"
    type: string
    sql: ${TABLE}.JournalLineClassRefListID ;;
  }

  dimension: dim_journal_line_credit_amount {
    label: "Line Credit Amount"
    hidden: yes
    type: number
    value_format_name: usd
    sql: ${TABLE}.JournalLineCreditAmount ;;
  }

  measure: journal_line_credit_amount {
    label: "Credit Amount"
    type: sum
    value_format_name: usd
    sql: ${dim_journal_line_credit_amount} ;;
  }

  dimension: dim_journal_line_debit_amount {
    label: "Line Debit Amount"
    hidden: yes
    type: number
    value_format_name: usd
    sql: ${TABLE}.JournalLineDebitAmount ;;
  }

  measure: journal_line_debit_amount {
    label: "Debit Amount"
    type: sum
    value_format_name: usd
    sql: ${dim_journal_line_debit_amount} ;;
  }

  dimension: journal_line_entity_ref_full_name {
    label: "Entity Ref Full Name"
    type: string
    sql: ${TABLE}.JournalLineEntityRefFullName ;;
  }

  dimension: journal_line_entity_ref_list_id {
    label: "zEntity Ref List ID"
    type: string
    sql: ${TABLE}.JournalLineEntityRefListID ;;
  }

  dimension: journal_line_memo {
    label: "Memo"
    type: string
    sql: ${TABLE}.JournalLineMemo ;;
  }

  dimension: journal_line_seq_no {
    label: "zSequence Number"
    type: number
    sql: ${TABLE}.JournalLineSeqNo ;;
  }

  dimension: journal_line_txn_line_id {
    label: "zTransaction Line ID"
    type: string
    sql: ${TABLE}.JournalLineTxnLineID ;;
  }

  dimension: journal_line_type {
    label: "Type"
    type: string
    sql: ${TABLE}.JournalLineType ;;
  }

  dimension_group: load_date {
    label: "zLoad"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.LoadDateTime ;;
  }

  dimension: ref_number {
    label: "zReference Number"
    type: string
    sql: ${TABLE}.RefNumber ;;
  }

  dimension_group: time_created {
    label: "zCreated"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.TimeCreated ;;
  }

  dimension_group: time_modified {
    label: "zModified"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.TimeModified ;;
  }

  dimension_group: txn {
    label: "Transaction"
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.TxnDate ;;
  }

  dimension: txn_date_macro {
    label: "zTransaction Date Macro"
    type: string
    sql: ${TABLE}.TxnDateMacro ;;
  }

  dimension: txn_id {
    label: "zTransaction ID"
    type: string
    sql: ${TABLE}.TxnID ;;
  }

  dimension: txn_number {
    label: "zTransaction Number"
    type: number
    sql: ${TABLE}.TxnNumber ;;
  }

  measure: count {
    type: count
    drill_fields: [journal_line_account_ref_full_name, journal_line_entity_ref_full_name, journal_line_class_ref_full_name]
  }
}
