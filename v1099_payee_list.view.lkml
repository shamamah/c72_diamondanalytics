view: v1099_payee_list {
  sql_table_name: rpt.v1099PayeeList ;;

  dimension_group: added {
    hidden: yes
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.added_date ;;
  }

  dimension: apt_num {
    hidden: yes
    type: string
    sql: ${TABLE}.apt_num ;;
  }

  dimension: business_type {
    type: string
    sql: ${TABLE}.business_type ;;
  }

  dimension: city {
    hidden: yes
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: claimpayee_id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.claimpayee_id ;;
  }

  dimension: claimpayee_num {
    hidden: yes
    type: number
    sql: ${TABLE}.claimpayee_num ;;
  }

  dimension: claimpayee_ver {
    hidden: yes
    type: number
    sql: ${TABLE}.claimpayee_ver ;;
  }

  dimension: display_name {
    type: string
    sql: ${TABLE}.display_name ;;
  }

  dimension: house_num {
    hidden: yes
    type: string
    sql: ${TABLE}.house_num ;;
  }

  dimension: is_legal_nameaddress {
    type: string
    sql: ${TABLE}.is_legal_nameaddress ;;
  }

  dimension: latest_version {
    hidden: yes
    type: string
    sql: ${TABLE}.latest_version ;;
  }

  dimension: legal_apt_num {
    type: string
    sql: ${TABLE}.legal_apt_num ;;
  }

  dimension: legal_city {
    type: string
    sql: ${TABLE}.legal_city ;;
  }

  dimension: legal_commercial_name1 {
    type: string
    sql: ${TABLE}.legal_commercial_name1 ;;
  }

  dimension: legal_commercial_name2 {
    type: string
    sql: ${TABLE}.legal_commercial_name2 ;;
  }

  dimension: legal_display_address {
    type: string
    sql: ${TABLE}.legal_display_address ;;
  }

  dimension: legal_display_name {
    type: string
    sql: ${TABLE}.legal_display_name ;;
  }

  dimension: legal_house_num {
    type: string
    sql: ${TABLE}.legal_house_num ;;
  }

  dimension: legal_other {
    type: string
    sql: ${TABLE}.legal_other ;;
  }

  dimension: legal_pobox {
    type: string
    sql: ${TABLE}.legal_pobox ;;
  }

  dimension: legal_state {
    type: string
    sql: ${TABLE}.legal_state ;;
  }

  dimension: legal_street_name {
    type: string
    sql: ${TABLE}.legal_street_name ;;
  }

  dimension: legal_taxnum {
    type: string
    sql: ${TABLE}.legal_taxnum ;;
  }

  dimension: legal_taxtype_id {
    type: number
    sql: ${TABLE}.legal_taxtype_id ;;
  }

  dimension: legal_zip {
    type: string
    sql: ${TABLE}.legal_zip ;;
  }

  dimension: other {
    hidden: yes
    type: string
    sql: ${TABLE}.other ;;
  }

  dimension: payee_status {
    type: string
    sql: ${TABLE}.payee_status ;;
  }

  dimension: pobox {
    hidden: yes
    type: string
    sql: ${TABLE}.pobox ;;
  }

  dimension: reportable {
    type: string
    sql: ${TABLE}.reportable ;;
  }

  dimension: state {
    hidden: yes
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: street_name {
    hidden: yes
    type: string
    sql: ${TABLE}.street_name ;;
  }

  dimension: sub_type {
    type: string
    sql: ${TABLE}.sub_type ;;
  }

  dimension: taxnum {
    hidden: yes
    type: string
    sql: ${TABLE}.taxnum ;;
  }

  dimension: taxtype_id {
    hidden: yes
    type: number
    sql: ${TABLE}.taxtype_id ;;
  }

  dimension: vendor {
    type: string
    #TT 311584 2021-01-15. Seems that column 'vendor' was changed to 'vendor_yesno_id', and values changed to Yes=1 and No=2
    #TT 255027 2019-04-24. DBD team changed the column name in view in Diamond DB
    #sql: case when ${TABLE}.vendor = 0 then 'No' else 'Yes' end ;;
    sql: case when ${TABLE}.vendor_yesno_id = 1 then 'Yes' else 'No' end ;;
  }

  dimension: zip {
    hidden: yes
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  measure: count {
    type: count
    drill_fields: [v_claim_detail_transaction.check_number, v_claim_detail_transaction.check_date_date, v_claim_detail_transaction.dim_amount,
      claim_control.claim_number, v_claim_detail_transaction.type_dscr, v_claim_detail_transaction.remark, v_claim_detail_transaction.pay_to_the_order_of,
      v_claim_detail_transaction.reissued, v_claim_detail_transaction.status, v_claim_detail_transaction.pay_type, v_claim_detail_transaction.bulk_check]
  }
}
