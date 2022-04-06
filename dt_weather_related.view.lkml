view: dt_weather_related {
  derived_table: {
    sql: select cc.claimcontrol_id,
        case when (count(cctt.claimtrackingtype_id)=1) then 'Yes' else 'No' end as weather_related
        from claimcontrol cc
        left outer join ClaimControlTrackingType cctt on cctt.claimcontrol_id = cc.claimcontrol_id
        and cctt.claimtrackingtype_id = 9
        group by cc.claimcontrol_id
       ;;
  }

#   measure: count {
#     type: count
#     drill_fields: [detail*]
#   }

  dimension: claimcontrol_id {
    hidden: yes
    type: number
    sql: ${TABLE}.claimcontrol_id ;;
  }

  dimension: weather_related {
    label: "Is Weather Related"
    type: string
    sql: ${TABLE}.weather_related ;;
  }

#   set: detail {
#     fields: [claimcontrol_id, weather_related]
#   }
}
