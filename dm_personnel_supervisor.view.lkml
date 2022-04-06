view: dm_personnel_supervisor {
  derived_table: {
    sql: select distinct c.id as claimid
        ,u.SourceSystem
        ,u.CompanyCode
        ,u.UserTitle
        ,u.UserFName as 'Supervisor First Name'
        ,u.UserLName as 'Supervisor Last Name'
        ,u.UserCity as 'Supervisor City'
        ,u.UserState as 'Supervisor State'
        ,u.UserZIP as 'Supervisor ZIP'
        ,u.UserCountry as 'Supervisor Country'
        ,u.BranchName as 'Supervisor Branch Name'
        ,u.Active as 'Supervisor is Active'
      from dbo.claim c
      inner join dbo.[user] u on c.SupervisorID = u.UserID
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

  dimension: supervisor_first_name {
    type: string
    label: "Name, First"
    sql: ${TABLE}."Supervisor First Name" ;;
  }

  dimension: supervisor_last_name {
    type: string
    label: "Name, Last"
    sql: ${TABLE}."Supervisor Last Name" ;;
  }

  dimension: supervisor_full_name {
    type: string
    label: "QA's Name"
    sql: ${supervisor_first_name} + ' ' + ${supervisor_last_name} ;;
  }

  dimension: supervisor_city {
    type: string
    label: "Address, City"
    sql: ${TABLE}."Supervisor City" ;;
  }

  dimension: supervisor_state {
    type: string
    label: "Address, State"
    sql: ${TABLE}."Supervisor State" ;;
  }

  dimension: supervisor_zip {
    type: string
    label: "Address, ZIP"
    sql: ${TABLE}."Supervisor ZIP" ;;
  }

  dimension: supervisor_country {
    type: string
    label: "Address, Country"
    sql: ${TABLE}."Supervisor Country" ;;
  }

  dimension: supervisor_branch_name {
    type: string
    label: "Branch"
    sql: ${TABLE}."Supervisor Branch Name" ;;
  }

  dimension: supervisor_is_active {
    type: string
    label: "Is Active"
    sql: case when ${TABLE}."Supervisor is Active"=1 then 'Yes' else 'No' end ;;
  }
}
