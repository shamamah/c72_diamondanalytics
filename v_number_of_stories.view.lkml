view: v_number_of_stories {
  sql_table_name: dbo.vNumberOfStories ;;

  dimension: dscr {
    type: string
    label: "Number Of Stories"
    sql: ${TABLE}.dscr ;;
  }

  dimension: numberofstoriestype_id {
    type: number
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.numberofstoriestype_id ;;
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
