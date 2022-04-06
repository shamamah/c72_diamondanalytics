view: v_roof_type {
  sql_table_name: dbo.vRoofType ;;

  dimension: dscr {
    type: string
    label: "Roof Type"
    sql: ${TABLE}.dscr ;;
  }

  dimension: rooftype_id {
    type: number
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.rooftype_id ;;
  }

  dimension: tableorder {
    type: number
    hidden:  yes
    sql: ${TABLE}.tableorder ;;
  }

  dimension: version_id {
    type: number
    hidden: yes
    sql: ${TABLE}.version_id ;;
  }

  measure: count {
    type: count
    hidden: yes
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
