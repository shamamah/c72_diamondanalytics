- view: transaction_type
  label: 'Transaction Type'
  sql_table_name: dbo.TransType
  fields:

  - dimension: description
#    hidden: true
    type: string
    sql: ${TABLE}.dscr

  - dimension: transtype
    hidden: true
    type: string
    sql: ${TABLE}.transtype

  - dimension: transtype_id
    hidden: true
    type: number
    sql: ${TABLE}.transtype_id
