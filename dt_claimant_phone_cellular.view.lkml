view: dt_claimant_phone_cellular {
  derived_table: {
    sql: select cpl.claimcontrol_id
        ,cpl.claimant_num
        ,p.phone_num
      from ClaimantPhoneLink cpl
        inner join phone p on p.phone_id = cpl.phone_id
        inner join phonetype pt on pt.phonetype_id = p.phonetype_id
          and pt.phonetype_id = 4
       ;;
  }

  dimension: compound_primary_key {
    type: string
    primary_key: yes
    hidden: yes
    sql: CONCAT(${claimcontrol_id},${claimant_num}) ;;
  }

  dimension: claimcontrol_id {
    hidden: yes
    type: number
    sql: ${TABLE}.claimcontrol_id ;;
  }

  dimension: claimant_num {
    hidden: yes
    type: number
    sql: ${TABLE}.claimant_num ;;
  }

  dimension: phone_num {
    type: string
    label: "Cellular Phone"
    sql: ${TABLE}.phone_num ;;
  }
}
