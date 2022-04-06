view: additional_interest_list_name_link {
  sql_table_name: dbo.AdditionalInterestListNameLink ;;

  dimension_group: added {
    type: time
    hidden: yes
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.added_date ;;
  }

  dimension: additionalinterestlist_id {
    type: number
    hidden: yes
    sql: ${TABLE}.additionalinterestlist_id ;;
  }

  dimension_group: last_modified {
    type: time
    hidden: yes
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified_date ;;
  }

  dimension: name_id {
    type: number
    hidden: yes
    sql: ${TABLE}.name_id ;;
  }

  dimension: nameaddresssource_id {
    type: number
    hidden: yes
    sql: ${TABLE}.nameaddresssource_id ;;
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
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      name.name_id,
      name.display_name,
      name.sort_name,
      name.prefix_name,
      name.first_name,
      name.middle_name,
      name.last_name,
      name.suffix_name
    ]
  }
}
