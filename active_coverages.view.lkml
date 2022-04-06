view: active_coverages {
  derived_table: {
    sql:
        SELECT DISTINCT [coveragecode_id], [caption] as dscr
        FROM [Diamond].[dbo].[CoverageCodeVersion]
       ;;
  }

  dimension: coveragecode_id {
    type: number
    hidden: yes
    sql: ${TABLE}.coveragecode_id ;;
  }

  dimension: dscr {
    label: "Coverage Description"
    type: string
    sql: ${TABLE}.dscr ;;
  }

}
