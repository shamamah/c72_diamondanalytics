view: dt_claim_salvage_adjuster {
  derived_table: {
    sql: select cc.claimcontrol_id, u.display_name
      from claimcontrol cc
        inner join ClaimControlPersonnel ccp on ccp.claimcontrol_id = cc.claimcontrol_id
        inner join ClaimAdjusterType cat on cat.claimadjustertype_id = ccp.claimadjustertype_id
        inner join ClaimPersonnel cp on cp.claimpersonnel_id = ccp.claimpersonnel_id
        inner join vUsers u on u.users_id = cp.users_id
      where ccp.claimadjustertype_id = 5 -- Salvage Adjuster
        and cp.users_id > 0
       ;;
  }

  dimension: claimcontrol_id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.claimcontrol_id ;;
  }

  dimension: display_name {
    label: "Adjuster-Salvage"
    type: string
    sql: ${TABLE}.display_name ;;
  }
}
