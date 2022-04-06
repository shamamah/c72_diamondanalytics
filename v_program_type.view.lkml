view: v_program_type {
  sql_table_name: dbo.vProgramType ;;

  dimension: dscr {
    type: string
    label: "Program Type"
    sql: ${TABLE}.dscr ;;
  }

  dimension: programtype_id {
    type: number
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.programtype_id ;;
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

  dimension: is_choice {
    label: "Is Program Choice"
    type: yesno
    sql: ${dscr} like '%Choice' ;;
  }

  measure: count {
    type: count
    hidden: yes
  }

}
