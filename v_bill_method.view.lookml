- view: v_bill_method
  sql_table_name: dbo.vBillMethod
  fields:

  - dimension: billmethod
    type: string
    sql: ${TABLE}.billmethod

  - dimension: billmethod_id
    type: number
    sql: ${TABLE}.billmethod_id

  - dimension: billmethodversion_id
    type: number
    sql: ${TABLE}.billmethodversion_id

  - dimension: dscr
    type: string
    sql: ${TABLE}.dscr

  - dimension: policyterm_id
    type: number
    sql: ${TABLE}.policyterm_id

  - dimension: policytermversion_id
    type: number
    sql: ${TABLE}.policytermversion_id

  - dimension: version_id
    type: number
    # hidden: true
    sql: ${TABLE}.version_id

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - version.version_id
    - version.print_classname
    - version.print_assemblyname
    - version.billing_forms_classname
    - version.billing_classname
    - version.billing_assemblyname
    - version.company_classname
    - version.company_assemblyname
    - version.business_classname
    - version.business_assemblyname
    - version.common_classname
    - version.common_assemblyname
    - version.ui_classname
    - version.ui_assemblyname
    - version.geocode_classname
    - version.geocode_assemblyname
    - version.ui_premiumaudit_classname
    - version.ui_premiumaudit_assemblyname

