view: policy_holder_sex {
  sql_table_name: dbo.Sex ;;

  dimension: sex_id {
    hidden: yes
    primary_key: yes
    type: number
    sql: ${TABLE}.sex_id ;;
  }

  dimension: dscr {
    label: "Sex"
    type: string
    sql: ${TABLE}.dscr ;;
  }
}
