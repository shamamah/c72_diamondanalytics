view: dm_personnel_manager {
  derived_table: {
    sql: select distinct c.id as claimid
        ,u.SourceSystem
        ,u.CompanyCode
        ,u.UserTitle
        ,u.UserFName as 'Manager First Name'
        ,u.UserLName as 'Manager Last Name'
        ,u.UserCity as 'Manager City'
        ,u.UserState as 'Manager State'
        ,u.UserZIP as 'Manager ZIP'
        ,u.UserCountry as 'Manager Country'
        ,u.BranchName as 'Manager Branch Name'
        ,u.Active as 'Manager is Active'
      from dbo.claim c
      inner join dbo.[user] u on c.ManagerID = u.UserID
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

  dimension: manager_first_name {
    type: string
    label: "Name, First"
    sql: ${TABLE}."Manager First Name" ;;
  }

  dimension: manager_last_name {
    type: string
    label: "Name, Last"
    sql: ${TABLE}."Manager Last Name" ;;
  }

  dimension: manager_full_name {
    type: string
    label: "Manager's Name"
    sql: ${manager_first_name} + ' ' + ${manager_last_name} ;;
  }

  dimension: manager_city {
    type: string
    label: "Address, City"
    sql: ${TABLE}."Manager City" ;;
  }

  dimension: manager_state {
    type: string
    label: "Address, State"
    sql: ${TABLE}."Manager State" ;;
  }

  dimension: manager_zip {
    type: string
    label: "Address, ZIP"
    sql: ${TABLE}."Manager ZIP" ;;
  }

  dimension: manager_country {
    type: string
    label: "Address, Country"
    sql: ${TABLE}."Manager Country" ;;
  }

  dimension: manager_branch_name {
    type: string
    label: "Branch"
    sql: ${TABLE}."Manager Branch Name" ;;
  }

  dimension: manager_is_active {
    type: string
    label: "Is Active"
    sql: case when ${TABLE}."Manager is Active"=1 then 'Yes' else 'No' end ;;
  }
}
