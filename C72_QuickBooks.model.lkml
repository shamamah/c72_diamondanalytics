connection: "c72-datamart-prod"

# include all the views
include: "qb*.view"

fiscal_month_offset: 0
week_start_day: sunday

explore: qb_invoice {
  group_label: "Transcynd Analytics [Test]"
  label: "Financials (Invoice)"
  #persist_for: "4 hours"
  view_label: "Invoice"

  join: qb_invoice_line {
    view_label: "Invoice Detail"
    type: left_outer
    relationship: one_to_many
    sql_on: ${qb_invoice.txn_id} = ${qb_invoice_line.txn_id} ;;
  }
}

explore: qb_journal_entry {
  group_label: "Transcynd Analytics [Test]"
  label: "Financials (Journal)"
  #persist_for: "4 hours"
  view_label: "Journal"

  join: qb_journal_entry_line {
    view_label: "Journal Line"
    type: inner
    relationship: one_to_many
    sql_on: ${qb_journal_entry.txn_id} = ${qb_journal_entry_line.txn_id} ;;
  }
}
