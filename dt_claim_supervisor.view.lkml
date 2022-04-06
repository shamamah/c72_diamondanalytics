view: dt_claim_supervisor {
  derived_table: {
    sql:

    select cc.claimcontrol_id
        ,cp.initials as supervisor_initials
        ,u.display_name as supervisor_Name

    from ClaimControlPersonnel ccp
      inner join ClaimControl cc on cc.claimcontrol_id = ccp.claimcontrol_id
      inner join ClaimPersonnel cp on cp.claimpersonnel_id = ccp.claimpersonnel_id
      inner join ClaimPersonnelType cpt on cpt.claimpersonneltype_id = ccp.claimpersonneltype_id
      inner join vUsers u on u.users_id = cp.users_id

    where cpt.claimpersonneltype_id = 1  --Supervisor only
    ;;
  }

#   measure: count {
#     type: count
#     drill_fields: [detail*]
#   }

  dimension: claimcontrol_id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.claimcontrol_id ;;
  }

  dimension: supervisor_initials {
    label: "Supervisor Initials"
    hidden: yes
    type: string
    sql: ${TABLE}.supervisor_initials ;;
  }

  dimension: supervisor_name {
    label: "Supervisor"
    type: string
    sql: ${TABLE}.supervisor_Name ;;
  }

  #   set: detail {
#     fields: [claimcontrol_id, adjuster_name]
#   }
}
