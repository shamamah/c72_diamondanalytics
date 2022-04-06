view: dt_asl_claim_level {
  derived_table: {
    sql: select distinct v2.claimcontrol_id,
        substring(
          (
            select distinct ',' + cast(asl.asl as varchar(10)) [text()]
            from vClaimDetail_Feature v1
              inner join ClaimCoverage cc on cc.claimcontrol_id = v1.claimcontrol_id
                and cc.claimexposure_id = v1.claimexposure_id
                and cc.claimsubexposure_num = v1.claimsubexposure_num
                and cc.claimcoverage_num = v1.claimcoverage_num
              inner join ASL asl on asl.asl_id = cc.asl_id
            where v1.claimcontrol_id = v2.claimcontrol_id
              and asl.asl <> '0'
            for XML path ('')
          ), 2, 5) ASL_Codes
from ClaimControl v2
 ;;
  }

  dimension: claimcontrol_id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.claimcontrol_id ;;
  }

  dimension: asl_codes {
    label: "ASL"
    type: string
    sql: ${TABLE}.ASL_Codes ;;
  }

}
