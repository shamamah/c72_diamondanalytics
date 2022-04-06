view: dt_transaction_payee_type {
  derived_table: {
    sql: select ctp.claimcontrol_id
        ,ctp.claimant_num
        ,ctp.claimfeature_num
        ,ctp.claimtransaction_num
        ,cp.claimpayeesubtype_id
        ,cp.claimpayee_id
        ,ctp.claimpayeetype_id
        ,ctp.added_date
        ,cpst.dscr
        ,case when cpst.claimpayeesubtype_id = 8 then 1 else 0 end as is_lender
      from ClaimTransactionPayee ctp
        left outer join ClaimPayee cp on cp.claimpayee_id = ctp.claimpayee_id
        left outer join ClaimPayeeSubType cpst on cpst.claimpayeesubtype_id = cp.claimpayeesubtype_id
       ;;
  }

  dimension: compound_primary_key {
    type: string
    primary_key: yes
    hidden: yes
    sql: CONCAT(${claimcontrol_id},${claimant_num},${claimfeature_num},${claimtransaction_num},${claimpayee_id}) ;;
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

  dimension: claimfeature_num {
    hidden: yes
    type: number
    sql: ${TABLE}.claimfeature_num ;;
  }

  dimension: claimtransaction_num {
    hidden: yes
    type: number
    sql: ${TABLE}.claimtransaction_num ;;
  }

  dimension: claimpayeesubtype_id {
    label: "Payee Type Code"
    type: number
    sql: ${TABLE}.claimpayeesubtype_id ;;
  }

  dimension: claimpayee_id {
    hidden: yes
    type: number
    sql: ${TABLE}.claimpayee_id ;;
  }

  dimension: claimpayeetype_id {
    hidden: yes
    type: number
    sql: ${TABLE}.claimpayeetype_id ;;
  }

  dimension: added_date {
    hidden: yes
    type: date
    sql: ${TABLE}.added_date ;;
  }

  dimension: dscr {
    label: "Payee Type"
    type: string
    sql: ${TABLE}.dscr ;;
  }

  dimension: is_lender {
    label: "Is Lender"
    type: string
    sql: case when ${TABLE}.is_lender=1 then 'Y' else 'N' end  ;;
  }
}
