view: qb_journal_entry {
  sql_table_name: qb.JournalEntry ;;

  dimension: txn_id {
    label: "Txn ID"
    primary_key: yes
    type: string
    sql: ${TABLE}.TxnID ;;
  }

  dimension: company_code {
    label: "Company Code"
    type: string
    sql: ${TABLE}.CompanyCode ;;
  }

  dimension: edit_sequence {
    label: "zEdit Sequence"
    type: string
    sql: ${TABLE}.EditSequence ;;
  }

  dimension: is_adjustment {
    label: "Is Adjustment"
    type: string
    sql: case when ${TABLE}.IsAdjustment=1 then 'Yes' else 'No' end ;;
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
    label: "zRef Number"
    type: string
    sql: ${TABLE}.RefNumber ;;
  }

  dimension_group: time_created {
    label: "Created"
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
    label: "Modified"
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

  dimension: txn_number {
    label: "zTransaction Number"
    type: number
    value_format_name: id
    sql: ${TABLE}.TxnNumber ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
