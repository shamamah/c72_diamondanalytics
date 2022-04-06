view: v_foundation_type {
  sql_table_name: dbo.vFoundationType ;;

  dimension: dscr {
    type: string
    label: "FoundationType"
    sql: ${TABLE}.dscr ;;
  }

  dimension: foundationtype_id {
    type: number
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.foundationtype_id ;;
  }

  dimension: tableorder {
    type: number
    hidden: yes
    sql: ${TABLE}.tableorder ;;
  }

  dimension: version_id {
    type: number
    hidden: yes
    sql: ${TABLE}.version_id ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      version.version_id,
      version.print_classname,
      version.print_assemblyname,
      version.billing_forms_classname,
      version.billing_classname,
      version.billing_assemblyname,
      version.company_classname,
      version.company_assemblyname,
      version.business_classname,
      version.business_assemblyname,
      version.common_classname,
      version.common_assemblyname,
      version.ui_classname,
      version.ui_assemblyname,
      version.geocode_classname,
      version.geocode_assemblyname,
      version.ui_premiumaudit_classname,
      version.ui_premiumaudit_assemblyname
    ]
  }
}
