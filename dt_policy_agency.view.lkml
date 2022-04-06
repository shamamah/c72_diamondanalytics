view: dt_policy_agency {
  derived_table: {
    sql: select pim.policy_id as 'policy_id', n.display_name as 'agency_name', a.display_address as 'agency_address', ag.code as 'agency_code'
          from dbo.policyimage pim
          inner join dbo.AgencyNameLink anl on anl.agency_id = pim.agency_id
          inner join dbo.[Name] n on n.name_id = anl.name_id
          inner join dbo.AgencyAddressLink aal on aal.agency_id = pim.agency_id
          inner join dbo.[Address] a on a.address_id = aal.address_id
          inner join dbo.[Agency] ag on ag.agency_id = pim.agency_id
             ;;
  }

#   measure: count {
#     type: count
#     drill_fields: [detail*]
#   }

  dimension: policy_id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.policy_id ;;
  }

  dimension: agency_code {
    label: "Agency Code"
    view_label: "Policy"
    type: string
    sql: ${TABLE}.agency_code ;;
  }

  dimension: agency_name {
    label: "Agency Name"
    view_label: "Policy"
    type: string
    sql: ${TABLE}.agency_name ;;
  }

  dimension: agency_address {
    label: "Agency Address"
    view_label: "Policy"
    type: string
    sql: ${TABLE}.agency_address ;;
  }

}
