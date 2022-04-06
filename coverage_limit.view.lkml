view: coverage_limit {
  sql_table_name: dbo.CoverageLimit ;;

  dimension: coveragelimit_id {
    hidden: yes
    type: string
    sql: ${TABLE}.coveragelimit_id ;;
  }

  dimension: deductible_dscr {
    label: "Deductible"
    type: string
    sql: ${TABLE}.deductible_dscr ;;
  }

  dimension: dscr {
    label: "Limit Description"
    type: string
    sql: case when ${coveragelimit_id} = '0' then ${coverage.manual_limit_amount} else  ${dscr_raw} end;;
  }
  dimension: dscr_raw {
    label: "Limit Description Raw"
    hidden: yes
    type: string
    sql:${TABLE}.limit_dscr ;;
  }

  dimension: peroccur_limit {
    label: "Per Occurence Limit"
    type: number
    value_format_name: usd
    sql: ${TABLE}.peroccur_limit ;;
  }

  dimension: perperson_limit {
    label: "Per Person Limit"
    type: number
    value_format_name: usd
    sql: ${TABLE}.perperson_limit ;;
  }
}
