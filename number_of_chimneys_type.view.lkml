view: number_of_chimneys_type {
  sql_table_name: dbo.NumberOfChimneysType ;;

  dimension: dscr {
    type: string
    label: "Number Of Chimneys"
    sql: ${TABLE}.dscr ;;
  }

  dimension_group: last_modified {
    type: time
    hidden: yes
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified_date ;;
  }

  dimension: numberofchimneystype_id {
    type: number
    hidden: yes

    sql: ${TABLE}.numberofchimneystype_id ;;
  }

  dimension_group: pcadded {
    type: time
    hidden: yes
    timeframes: [time, date, week, month]
    sql: ${TABLE}.pcadded_date ;;
  }

  measure: count {
    type: count
    hidden: yes
    drill_fields: []
  }
}
