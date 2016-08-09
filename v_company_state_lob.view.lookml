- view: company_state_lob
  label: 'Company/State/LOB'
  sql_table_name: dbo.vCompanyStateLOB
  fields:

  - dimension: commercial_name1
    label: 'Company Name'
    type: string
    sql: ${TABLE}.commercial_name1

  - dimension: company_id
    hidden: true
    type: number
    sql: ${TABLE}.company_id

  - dimension: companylob_id
    hidden: true
    type: number
    sql: ${TABLE}.companylob_id

  - dimension: companystate_id
    hidden: true
    type: number
    sql: ${TABLE}.companystate_id

  - dimension: companystatelob_id
    hidden: true
    type: number
    sql: ${TABLE}.companystatelob_id

  - dimension: lob_id
    hidden: true
    type: number
    sql: ${TABLE}.lob_id

  - dimension: lobname
    label: 'LOB'
    type: string
    sql: ${TABLE}.lobname

  - dimension: state
    label: 'State'
    type: string
    sql: ${TABLE}.state

  - dimension: state_id
    hidden: true
    type: number
    sql: ${TABLE}.state_id