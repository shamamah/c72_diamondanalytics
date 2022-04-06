view: coverage_code {
  sql_table_name: dbo.CoverageCode ;;

  dimension: coveragecode {
    label: "Code"
    type: string
    sql: ${TABLE}.coveragecode ;;
  }

  dimension: coveragecode_id {
    hidden: yes
    type: number
    sql: ${TABLE}.coveragecode_id ;;
  }

  dimension: coveragetype {
    label: "Type"
    type: string
    sql: ${TABLE}.coveragetype ;;
  }

  dimension: dscr {
    label: "Coverage Description"
    type: string
    sql: ${TABLE}.dscr ;;
  }
}
