view: dt_claim_outside_adjuster {
  derived_table: {
    sql: select cc.claimcontrol_id, cc.claim_number
        --,'ClaimControlPersonnel' as ClaimControlPersonnel, ccp.*
        --,'ClaimPersonnel' as ClaimPersonnel, cp.*
        ,cp.[enabled] as Is_Claim_Personnel_Enabled, cp.initials, cp.claimoffice_id
        --,'ClaimPersonnelType' as ClaimPersonnelType, cpt.*
        ,cpt.claimpersonneltype_id as claim_personnel_type_id, cpt.dscr as ClaimPersonnelType_dscr
        --,'ClaimAdjusterType' as ClaimAdjusterType, cat.*
        ,cat.claimadjustertype_id as claim_adjuster_type_id, cat.dscr as ClaimAdjusterType_dscr, cat.[enabled] as Is_Adjuster_Enabled
        --,'vUsers' as vUsers
        ,u.display_name as Adjuster_Name
      from ClaimControlPersonnel ccp
        inner join ClaimControl cc on cc.claimcontrol_id = ccp.claimcontrol_id
        inner join ClaimPersonnel cp on cp.claimpersonnel_id = ccp.claimpersonnel_id
        inner join ClaimPersonnelType cpt on cpt.claimpersonneltype_id = ccp.claimpersonneltype_id
        inner join ClaimAdjusterType cat on cat.claimadjustertype_id = ccp.claimadjustertype_id
        inner join vUsers u on u.users_id = cp.users_id
      where ccp.claimpersonnel_id <> 0
        and cat.[enabled] <> 0
        and cpt.claimpersonneltype_id = 3  --adjusters only
        and cat.claimadjustertype_id = 2   --inside only
 ;;
  }

dimension: claimcontrol_id {
  primary_key: yes
  hidden: yes
  type: number
  sql: ${TABLE}.claimcontrol_id ;;
}

#   dimension: claim_number {
#     type: string
#     sql: ${TABLE}.claim_number ;;
#   }

#   dimension: is_claim_personnel_enabled {
#     type: string
#     sql: ${TABLE}.Is_Claim_Personnel_Enabled ;;
#   }

dimension: initials {
  label: "Outside Adjuster Initials"
  hidden: yes
  type: string
  sql: ${TABLE}.initials ;;
}

#   dimension: claimoffice_id {
#     type: number
#     sql: ${TABLE}.claimoffice_id ;;
#   }

#   dimension: claim_personnel_type_id {
#     type: number
#     sql: ${TABLE}.claim_personnel_type_id ;;
#   }

#   dimension: claim_personnel_type_dscr {
#     type: string
#     sql: ${TABLE}.ClaimPersonnelType_dscr ;;
#   }

#   dimension: claim_adjuster_type_id {
#     type: number
#     sql: ${TABLE}.claim_adjuster_type_id ;;
#   }

#   dimension: claim_adjuster_type_dscr {
#     type: string
#     sql: ${TABLE}.ClaimAdjusterType_dscr ;;
#   }

#   dimension: is_adjuster_enabled {
#     type: string
#     sql: ${TABLE}.Is_Adjuster_Enabled ;;
#   }

dimension: adjuster_name {
  label: "Outside Adjuster"
  type: string
  sql: ${TABLE}.Adjuster_Name ;;
}
}
