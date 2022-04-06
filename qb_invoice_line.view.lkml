view: qb_invoice_line {
  sql_table_name: qb.InvoiceLine ;;

  dimension: fqprimary_key {
    primary_key: yes
    hidden: no
    label: "FQ Primary Key"
    type: string
    sql: ${TABLE}.FQPrimaryKey ;;
  }

  dimension: applied_amount {
    hidden: yes
    type: number
    sql: ${TABLE}.AppliedAmount ;;
  }

#   measure: total_applied_amount {
#     label: "Total Applied Amount"
#     type: sum
#     value_format_name: usd
#     sql: ${applied_amount} ;;
#   }

  dimension: araccount_ref_full_name {
    label: "zAR Account Ref Full Name"
    type: string
    sql: ${TABLE}.ARAccountRefFullName ;;
  }

  dimension: araccount_ref_list_id {
    label: "zAR Account Ref List ID"
    type: string
    sql: ${TABLE}.ARAccountRefListID ;;
  }

  dimension: class_ref_full_name {
    label: "zClass Ref Full Name"
    type: string
    sql: ${TABLE}.ClassRefFullName ;;
  }

  dimension: class_ref_list_id {
    label: "zClass Ref List ID"
    type: string
    sql: ${TABLE}.ClassRefListID ;;
  }

#   dimension: company_code {
#     type: string
#     sql: ${TABLE}.CompanyCode ;;
#   }

  dimension: customer_ref_full_name {
    label: "zCustomer Ref Full Name"
    type: string
    sql: ${TABLE}.CustomerRefFullName ;;
  }

  dimension: customer_ref_list_id {
    label: "zCustomer Ref List ID"
    type: string
    sql: ${TABLE}.CustomerRefListID ;;
  }

  dimension: customer_sales_tax_code_ref_full_name {
    label: "zCustomer Sales Tax Code Ref Full Name"
    type: string
    sql: ${TABLE}.CustomerSalesTaxCodeRefFullName ;;
  }

  dimension: customer_sales_tax_code_ref_list_id {
    label: "zCustomer Sales Tax Code Ref List ID"
    type: string
    sql: ${TABLE}.CustomerSalesTaxCodeRefListID ;;
  }

  dimension: customer_tax_code_ref_list_id {
    label: "zCustomer Tax Code Ref List ID"
    type: string
    sql: ${TABLE}.CustomerTaxCodeRefListID ;;
  }

  dimension_group: due {
    label: "zDue"
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
    sql: ${TABLE}.DueDate ;;
  }

  dimension: edit_sequence {
    label: "zEdit Sequence"
    type: string
    sql: ${TABLE}.EditSequence ;;
  }

  dimension: fqsave_to_cache {
    label: "zFQ Save To Cache"
    type: string
    sql: ${TABLE}.FQSaveToCache ;;
  }

  dimension: fqtxn_link_key {
    label: "zFQ Transaction Link Key"
    type: string
    sql: ${TABLE}.FQTxnLinkKey ;;
  }

  dimension: invoice_line_amount {
    hidden: yes
    label: "Line Amount"
    type: number
    sql: ${TABLE}.InvoiceLineAmount ;;
  }

  measure: total_line_amount {
    label: "Line Amount"
    type: sum
    value_format_name: usd
    sql: ${invoice_line_amount} ;;
  }

  dimension: invoice_line_class_ref_full_name {
    label: "zLine Class Ref Full Name"
    type: string
    sql: ${TABLE}.InvoiceLineClassRefFullName ;;
  }

  dimension: invoice_line_class_ref_list_id {
    label: "zLine Class Ref List ID"
    type: string
    sql: ${TABLE}.InvoiceLineClassRefListID ;;
  }

  dimension: invoice_line_desc {
    label: "Line Description"
    type: string
    sql: ${TABLE}.InvoiceLineDesc ;;
  }

  dimension: invoice_line_item_ref_full_name {
    label: "Line Item Ref Full Name"
    type: string
    sql: ${TABLE}.InvoiceLineItemRefFullName ;;
  }

  dimension: invoice_line_item_ref_list_id {
    label: "zLine Item Ref List ID"
    type: string
    sql: ${TABLE}.InvoiceLineItemRefListID ;;
  }

  dimension: invoice_line_quantity {
    label: "Line Quantity"
    type: number
    sql: ${TABLE}.InvoiceLineQuantity ;;
  }

  dimension: invoice_line_rate {
    label: "Line Rate"
    type: number
    sql: ${TABLE}.InvoiceLineRate ;;
  }

  dimension: invoice_line_sales_tax_code_ref_full_name {
    label: "zLine Sales Tax Code Ref Full Name"
    type: string
    sql: ${TABLE}.InvoiceLineSalesTaxCodeRefFullName ;;
  }

  dimension: invoice_line_sales_tax_code_ref_list_id {
    label: "zLine Sales Tax Code Ref List ID"
    type: string
    sql: ${TABLE}.InvoiceLineSalesTaxCodeRefListID ;;
  }

  dimension: invoice_line_seq_no {
    label: "zLine Sequence Number"
    type: number
    sql: ${TABLE}.InvoiceLineSeqNo ;;
  }

  dimension: invoice_line_tax_amount {
    label: "zLine Tax Amount"
    type: number
    sql: ${TABLE}.InvoiceLineTaxAmount ;;
  }

  dimension: invoice_line_tax_code_ref_full_name {
    label: "zLine Tax Code Ref Full Name"
    type: string
    sql: ${TABLE}.InvoiceLineTaxCodeRefFullName ;;
  }

  dimension: invoice_line_tax_code_ref_list_id {
    label: "zLine Tax Code Ref List ID"
    type: string
    sql: ${TABLE}.InvoiceLineTaxCodeRefListID ;;
  }

  dimension: invoice_line_txn_line_id {
    label: "zLine Transaction Line ID"
    type: string
    sql: ${TABLE}.InvoiceLineTxnLineID ;;
  }

  dimension: invoice_line_type {
    label: "zLine Type"
    type: string
    sql: ${TABLE}.InvoiceLineType ;;
  }

  dimension: is_finance_charge {
    label: "xIs Finance Charge"
    type: string
    sql: ${TABLE}.IsFinanceCharge ;;
  }

  dimension: is_paid {
    label: "Is Paid"
    type: string
    sql: case when ${TABLE}.IsPaid=1 then 'Yes' else 'No' end ;;
  }

  dimension: is_pending {
    label: "zIs Pending"
    type: string
    sql: case when ${TABLE}.IsPending=1 then 'Yes' else 'No' end ;;
  }

  dimension: is_tax_included {
    type: string
    sql: case when ${TABLE}.IsTaxIncluded=0 then 'Yes' else 'No' end ;;
  }

  dimension: is_to_be_emailed {
    label: "zIs To Be Emailed"
    type: string
    sql: case when ${TABLE}.IsToBeEmailed=1 then 'Yes' else 'No' end ;;
  }

  dimension: is_to_be_printed {
    label: "zIs To Be Printed"
    type: string
    sql: case when ${TABLE}.IsToBePrinted=1 then 'Yes' else 'No' end ;;
  }

  dimension: item_sales_tax_ref_full_name {
    label: "zItem Sales Tax Ref Full Name"
    type: string
    sql: ${TABLE}.ItemSalesTaxRefFullName ;;
  }

  dimension: item_sales_tax_ref_list_id {
    label: "zItem Sales Tax Ref List ID"
    type: string
    sql: ${TABLE}.ItemSalesTaxRefListID ;;
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

  dimension: memo {
    label: "zMemo"
    type: string
    sql: ${TABLE}.Memo ;;
  }

  dimension: memo_adjuster_name {
    label: "Adjuster Name (Memo)"
    type: string
    sql: ${TABLE}.MemoAdjusterName ;;
  }

  dimension: memo_claim_no {
    label: "Claim Number (Memo)"
    type: string
    sql: ${TABLE}.MemoClaimNo ;;
  }

  dimension: memo_client {
    label: "Client (Memo)"
    type: string
    sql: ${TABLE}.MemoClient ;;
  }

  dimension: memo_client_company {
    label: "Client Company (Memo)"
    type: string
    sql: ${TABLE}.MemoClientCompany ;;
  }

  dimension: memo_file_no {
    label: "File Number (Memo)"
    type: string
    sql: ${TABLE}.MemoFileNo ;;
  }

  dimension: memo_insured_name {
    label: "Insured Name (Memo)"
    type: string
    sql: ${TABLE}.MemoInsuredName ;;
  }

  dimension: memo_loss_address {
    label: "zLoss Address (Memo)"
    type: string
    sql: ${TABLE}.MemoLossAddress ;;
  }

  dimension: ponumber {
    label: "zPO Number (File Number)"
    type: string
    sql: ${TABLE}.PONumber ;;
  }

  dimension: ref_number {
    label: "zRef Number (Invoice Number)"
    type: string
    sql: ${TABLE}.RefNumber ;;
  }

  dimension: sales_rep_ref_full_name {
    label: "zSales Rep Ref Full Name"
    type: string
    sql: ${TABLE}.SalesRepRefFullName ;;
  }

  dimension: sales_rep_ref_list_id {
    label: "zSales Rep Ref List ID"
    type: string
    sql: ${TABLE}.SalesRepRefListID ;;
  }

  dimension: sales_tax_percentage {
    label: "zSales Tax Percentage"
    type: number
    sql: ${TABLE}.SalesTaxPercentage ;;
  }

  dimension: sales_tax_total {
    hidden: yes
    label: "Sales Tax"
    type: number
    sql: ${TABLE}.SalesTaxTotal ;;
  }

#   measure: total_sales_tax {
#     label: "Total Sales Tax"
#     type: sum
#     value_format_name: usd
#     sql: ${sales_tax_total} ;;
#   }

  dimension_group: ship {
    label: "zShip"
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
    sql: ${TABLE}.ShipDate ;;
  }

  dimension: subtotal {
    hidden: yes
    label: "Subtotal"
    type: number
    sql: ${TABLE}.Subtotal ;;
  }

#   measure: Total_Subtotal {
#     label: "Total Subtotal"
#     type: sum
#     value_format_name: usd
#     sql: ${subtotal} ;;
#   }

  dimension: tax1_total {
    label: "zTax1 Total"
    type: number
    sql: ${TABLE}.Tax1Total ;;
  }

  dimension: tax2_total {
    label: "zTax2 Total"
    type: number
    sql: ${TABLE}.Tax2Total ;;
  }

  dimension: template_ref_full_name {
    label: "zTemplate Ref Full Name"
    type: string
    sql: ${TABLE}.TemplateRefFullName ;;
  }

  dimension: template_ref_list_id {
    label: "zTemplate Ref List ID"
    type: string
    sql: ${TABLE}.TemplateRefListID ;;
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
    hidden: no
    type: string
    sql: ${TABLE}.TxnID ;;
  }

  dimension: txn_number {
    label: "Transaction Number"
    type: number
    value_format_name: id
    sql: ${TABLE}.TxnNumber ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      fqprimary_key,
      customer_ref_full_name,
      class_ref_full_name,
      araccount_ref_full_name,
      template_ref_full_name,
      memo_insured_name,
      memo_adjuster_name,
      sales_rep_ref_full_name,
      item_sales_tax_ref_full_name,
      customer_sales_tax_code_ref_full_name,
      invoice_line_item_ref_full_name,
      invoice_line_class_ref_full_name,
      invoice_line_sales_tax_code_ref_full_name,
      invoice_line_tax_code_ref_full_name,
      invoice_line_amount,
      sales_tax_total

    ]
  }
}
