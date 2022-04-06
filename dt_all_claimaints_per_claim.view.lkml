view: dt_all_claimants_per_claim {
  derived_table: {
    sql: select distinct v2.claimcontrol_id,
        substring(
          (
            select ',' + v1.display_name as [text()]
            from vClaimDetail_Claimant v1
            where v1.claimcontrol_id = v2.claimcontrol_id
            order by v1.claimcontrol_id
            for XML path ('')
          ), 2, 1000) claimant_names
      from vClaimDetail_Claimant v2
       ;;
  }

  dimension: claimcontrol_id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.claimcontrol_id ;;
  }

  dimension: claimant_names {
    type: string
    sql: ${TABLE}.claimant_names ;;
  }
}
