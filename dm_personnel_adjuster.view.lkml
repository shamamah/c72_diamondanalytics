view: dm_personnel_adjuster {
  derived_table: {
    sql: select distinct c.id as claimid
        ,u.SourceSystem
        ,u.CompanyCode
        ,u.UserTitle
        ,u.UserFName as 'Adjuster First Name'
        ,u.UserLName as 'Adjuster Last Name'
        ,u.UserCity as 'Adjuster City'
        ,u.UserState as 'Adjuster State'
        ,u.UserZIP as 'Adjuster ZIP'
        ,u.UserCountry as 'Adjuster Country'
        ,u.BranchName as 'Adjuster Branch Name'
        ,u.Active as 'Adjuster is Active'
      from dbo.claim c
      inner join dbo.[user] u on c.AdjusterID = u.UserID
       ;;
  }

  dimension: claim_id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.claimid ;;
  }

  dimension: source_system {
    label: "Source System"
    type: string
    sql: ${TABLE}.SourceSystem ;;
  }

  dimension: company_code {
    label: "Company Code"
    type: string
    sql: ${TABLE}.CompanyCode ;;
  }

  dimension: user_title {
    label: "Title"
    type: string
    sql: ${TABLE}.UserTitle ;;
  }

  dimension: adjuster_first_name {
    type: string
    label: "Name, First"
    sql: ${TABLE}."Adjuster First Name" ;;
  }

  dimension: adjuster_last_name {
    type: string
    label: "Name, Last"
    sql: ${TABLE}."Adjuster Last Name" ;;
  }

  dimension: adjuster_full_name {
    type: string
    label: "Adjuster's Name"
    sql: ${adjuster_first_name} + ' ' + ${adjuster_last_name} ;;
  }

  dimension: adjuster_city {
    type: string
    label: "Address, City"
    sql: ${TABLE}."Adjuster City" ;;
  }

  dimension: adjuster_state {
    type: string
    label: "Address, State"
    sql: ${TABLE}."Adjuster State" ;;
  }

  dimension: adjuster_zip {
    type: string
    label: "Address, ZIP"
    sql: ${TABLE}."Adjuster ZIP" ;;
  }

  dimension: adjuster_country {
    type: string
    label: "Address, Country"
    sql: ${TABLE}."Adjuster Country" ;;
  }

  dimension: adjuster_branch_name {
    type: string
    label: "Branch"
    sql: ${TABLE}."Adjuster Branch Name" ;;
  }

  dimension: adjuster_is_active {
    type: string
    label: "Is Active"
    sql: case when ${TABLE}."Adjuster is Active"=1 then 'Yes' else 'No' end ;;
  }
}
