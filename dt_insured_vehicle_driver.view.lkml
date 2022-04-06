view: dt_insured_vehicle_driver {
  derived_table: {
    sql: select distinct v2.claimcontrol_id,
        substring(
          (
            select ',' + v1.display_name as [text()]
            from vClaimDetail_Claimant v1
            where v1.claimcontrol_id = v2.claimcontrol_id and v1.claimanttypecode = 'DRIV'
            order by v1.claimcontrol_id
            for XML path ('')
          ), 2, 1000) insured_vehicle_driver
      from vClaimDetail_Claimant v2
      ;;
  }

  dimension: claimcontrol_id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.claimcontrol_id ;;
  }

  dimension: insured_vehicle_driver {
    label: "Insured Vehicle Driver"
    type: string
    sql: ${TABLE}.insured_vehicle_driver ;;
  }
}
