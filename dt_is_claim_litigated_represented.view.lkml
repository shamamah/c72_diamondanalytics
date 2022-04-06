view: dt_is_claim_litigated_represented {
  derived_table: {
    sql: select distinct cc.claimcontrol_id,
        ISNULL(substring(
          (
            select ',' + (case when (v.is_represented=1 OR v.in_litigation=1) then 'Yes' else 'No' end) as [text()]
            from vClaimDetail_Claimant v
            where v.claimcontrol_id = cc.claimcontrol_id
        and (is_represented = 1 or in_litigation = 1)
            order by v.claimcontrol_id
            for XML path ('')
          ), 2, 1000),'No') Is_Represented_Litigated
      from claimcontrol cc  ;;
  }

  dimension: claimcontrol_id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.claimcontrol_id ;;
  }

  dimension: is_represented_litigated {
    label: "Is Litigated/Represented"
    type: string
    sql: ${TABLE}.Is_Represented_Litigated ;;
  }
}
