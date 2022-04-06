view: dt_loss_location {
  derived_table: {
    sql: SELECT ccal.claimcontrol_id
      ,ccal.address_id
      ,a.display_address as 'Loss Address'
      ,a.house_num
      ,a.street_name
      ,a.apt_num
      ,a.city
      ,a.county
      ,s.[state]
      ,a.zip
      ,nas.dscr as 'Location Type'
        FROM [dbo].[ClaimControlAddressLink] ccal
        inner join dbo.[address] a on a.address_id = ccal.address_id
        inner join dbo.NameAddressSource nas on nas.nameaddresssource_id = ccal.nameaddresssource_id
        inner join dbo.[State] s on s.state_id = a.state_id
      where ccal.nameaddresssource_id = 24
       ;;
  }

  # measure: count {
  #   type: count
  #   drill_fields: [detail*]
  # }

  dimension: claimcontrol_id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.claimcontrol_id ;;
  }

  dimension: address_id {
    hidden: yes
    type: number
    sql: ${TABLE}.address_id ;;
  }

  dimension: loss_address {
    type: string
    label: "Full Address"
    sql: ${TABLE}."Loss Address" ;;
  }

  dimension: house_num {
    type: string
    label: "House Num"
    sql: ${TABLE}.house_num ;;
  }

  dimension: street_name {
    type: string
    label: "Street Name"
    sql: ${TABLE}.street_name ;;
  }

  dimension: apt_num {
    type: string
    label: "Apt Num"
    sql: ${TABLE}.apt_num ;;
  }

  dimension: city {
    type: string
    label: "City"
    sql: ${TABLE}.city ;;
  }

  dimension: county {
    type: string
    label: "County"
    sql: ${TABLE}.county ;;
  }

  dimension: state {
    type: string
    label: "State"
    sql: ${TABLE}.state ;;
  }

  dimension: zip {
    type: zipcode
    label: "Zip"
    sql: left(${TABLE}.zip,5) ;;
    drill_fields: [detail*]
  }

  dimension: location_type {
    hidden: yes
    type: string
    label: "Location Type"
    sql: ${TABLE}."Location Type" ;;
  }

  set: detail {
    fields: [
      claim_control.claim_number,
      dt_all_claimant_per_claim.claimant_names
    ]
  }
}
