view: dt_policy_holder {
  derived_table: {
    sql: select pil.policy_id
        ,n.display_name
        ,n.first_name
        ,n.middle_name
        ,n.last_name
        ,nas.dscr
        ,a.apt_num
        ,a.house_num
        ,a.street_name
        ,a.city
        ,a.county
        ,s.state
        ,left(a.zip,5) as zip
        ,a.display_address
        --,s.*
        --,pial.*
        --,a.*
            from dbo.PolicyImageNameLink pil
              inner join dbo.[Name] n on n.name_id = pil.name_id
              inner join dbo.NameAddressSource nas on nas.nameaddresssource_id = pil.nameaddresssource_id
          inner join dbo.PolicyImageAddressLink pial on pial.policy_id = pil.policy_id
            and pial.policyimage_num = pil.policyimage_num
          inner join dbo.[address] a on a.address_id = pial.address_id
          inner join dbo.[state] s on s.state_id = a.state_id
            --where n.nameaddresssource_id in (3,4)
            where n.nameaddresssource_id in (3)
              and a.nameaddresssource_id = 3
            --3 is policy holder 1 and 4 is policy holder 2...We will only retrieve policy holder 1
       ;;
  }

  dimension: policy_id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.policy_id ;;
  }

  dimension: policy_holder_1 {
    label: "Name"
    type: string
    sql: case when ${dscr} = 'Policy Holder 1' then ${TABLE}.display_name else NULL end ;;
  }

#   dimension: policy_holder_2 {
#     label: "Policy Holder 2"
#     hidden: yes
#     type: string
#     sql: case when ${dscr} = 'Policy Holder 2' then ${TABLE}.display_name else NULL end ;;
#   }

  dimension: first_name {
    label: "First Name"
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: middle_name {
    label: "Middle Name"
    type: string
    sql: ${TABLE}.middle_name ;;
  }

  dimension: last_name {
    label: "Last Name"
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: dscr {
    hidden: yes
    type: string
    sql: ${TABLE}.dscr ;;
  }

  dimension: apt_num {
    label: "Apt Number"
    type: string
    sql: ${TABLE}.apt_num ;;
  }

  dimension: house_num {
    label: "House Number"
    type: string
    sql: ${TABLE}.house_num ;;
  }

  dimension: street_name {
    label: "Street Name"
    type: string
    sql: ${TABLE}.street_name ;;
  }

  dimension: address_line_1 {
    label: "Address Line 1"
    type: string
    sql: ${house_num} + ' ' + ${street_name} ;;
  }

  dimension: city {
    label: "City"
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: county {
    label: "County"
    type: string
    sql: ${TABLE}.county ;;
  }

  dimension: state {
    label: "State"
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: zip {
    label: "ZIP"
    type: string
    sql: ${TABLE}.zip ;;
  }

  dimension: display_address {
    label: "Full Address"
    type: string
    sql: ${TABLE}.display_address ;;
  }
}
