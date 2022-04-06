view: dt_claims_notes {
  derived_table: {
    sql: SELECT nkl.key_value as claimcontrol_id, u.display_name, n.pcadded_date as added_date, n.title, n.note_status, n.is_sticky, n.system_generated, n.is_private
      FROM [NotesKeyLink] NKL
      INNER JOIN [Notes] N (NOLOCK)
             ON N.note_id = NKL.note_Id
      inner join vUsers u (NOLOCK)
          ON u.users_id = n.users_id
      WHERE NKL.key_value > 0
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: claimcontrol_id {
    type: number
    sql: ${TABLE}.claimcontrol_id ;;
  }

  dimension: display_name {
    type: string
    sql: ${TABLE}.display_name ;;
  }

  dimension_group: added_date {
    type: time
    sql: ${TABLE}.added_date ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: note_status {
    type: string
    sql: ${TABLE}.note_status ;;
  }

  dimension: is_sticky {
    type: string
    sql: ${TABLE}.is_sticky ;;
  }

  dimension: system_generated {
    type: string
    sql: ${TABLE}.system_generated ;;
  }

  dimension: is_private {
    type: string
    sql: ${TABLE}.is_private ;;
  }

  set: detail {
    fields: [
      claimcontrol_id,
      display_name,
      added_date_time,
      title,
      note_status,
      is_sticky,
      system_generated,
      is_private
    ]
  }
}
