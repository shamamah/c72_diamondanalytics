view: dt_transaction_payee_address {
  derived_table: {
    sql: select ctp.claimcontrol_id
        ,ctp.claimant_num
        ,ctp.claimfeature_num
        ,ctp.claimtransaction_num
        ,cp.claimpayee_id
        ,ctp.added_date
        ,a.display_address
        --,a.pobox
        ,case when trim(a.pobox) = '' then null else a.pobox end as pobox           --2019-02-28  SH Replace the previous line
        --,house_num
        ,case when trim(house_num) = '' then null else house_num end as house_num   --2019-02-28  SH Replace the previous line
        ,a.street_name
        ,a.apt_num
        ,a.city
        ,s.state
        ,left(a.zip,5) as zip_code
      from ClaimTransactionPayee ctp
        left outer join ClaimPayee cp on cp.claimpayee_id = ctp.claimpayee_id
        left outer join ClaimPayeeAddressLink cpal on cpal.claimpayee_id = cp.claimpayee_id
        left outer join [Address] a on a.address_id = cpal.address_id
        left outer join [State] s on s.state_id = a.state_id
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

  dimension: claimpayee_id {
    hidden: yes
    type: number
    sql: ${TABLE}.claimpayee_id ;;
  }

  dimension: added_date {
    hidden: yes
    type: date
    sql: ${TABLE}.added_date ;;
  }

  dimension: display_address {
    hidden: yes
    label: "Payee Address"
    type: string
    sql: ${TABLE}.display_address ;;
  }

  dimension: pobox {
    hidden: yes
    label: "Payee PO Box"
    type: number
    sql: ${TABLE}.pobox ;;
  }

  dimension: house_num {
    hidden: yes
    label: "Payee House Number"
    type: string
    sql: ${TABLE}.house_num ;;
  }

  dimension: street_name {
    hidden: yes
    label: "Payee Street Name"
    type: string
    sql: ${TABLE}.street_name ;;
  }

  dimension: apt_num {
    hidden: yes
    label: "Payee Unit Number"
    type: string
    sql: ${TABLE}.apt_num ;;
  }

  dimension: payee_address {
    label: "Payee Address"
    type: string
    #sql: trim(${house_num} + ' ' + ${street_name} + ' ' + ${apt_num}) ;;
    sql: case when ISNULL(${pobox},'zzz')<>'zzz'
      then 'PO Box ' +  ${pobox}
      else trim(${house_num} + ' ' + ${street_name} + ' ' + ${apt_num})
      end ;;
  }

  dimension: city {
    label: "Payee City"
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: state {
    label: "Payee State"
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: zip_code {
    label: "Payee ZIP"
    type: string
    sql: ${TABLE}.zip_code ;;
  }
}
