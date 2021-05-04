view: dt_catastrophe_states_types {
  derived_table: {
    sql: SELECT distinct cc.claimcatastrophe_id,
        substring(
        (
          SELECT ',' + S.[state] as [text()]
          FROM ClaimCatastrophe CC1
          LEFT JOIN ClaimCatastropheStateLink CCSL ON CCSL.claimcatastrophe_id = CC1.claimcatastrophe_id
          LEFT JOIN [State] S ON S.state_id = CCSL.state_id
          WHERE CC1.claimcatastrophe_id = CC.claimcatastrophe_id
          ORDER BY S.[State]
          for XML path ('')
        ), 2, 1000) state_names,
        substring(
        (
          SELECT ',' + CCT.dscr as [text()]
          FROM ClaimCatastrophe CC2
          LEFT JOIN ClaimCatastropheClaimCatastropheTypeLink CCTL ON CCTL.claimcatastrophe_id = CC2.claimcatastrophe_id
          LEFT JOIN ClaimCatastropheType CCT ON CCT.claimcatastrophetype_id = CCTL.claimcatastrophetype_id
          WHERE CC2.claimcatastrophe_id = cc.claimcatastrophe_id
          ORDER BY CCT.dscr
          for XML path ('')
        ), 2, 1000) cat_types

      FROM ClaimCatastrophe cc
       ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [detail*]
  }

  dimension: claimcatastrophe_id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.claimcatastrophe_id ;;
  }

  dimension: state_names {
    label: "States"
    type: string
    sql: ${TABLE}.state_names ;;
  }

  dimension: cat_types {
    label: "Types"
    type: string
    sql: ${TABLE}.cat_types ;;
  }

  set: detail {
    fields: [claimcatastrophe_id, state_names, cat_types]
  }
}
