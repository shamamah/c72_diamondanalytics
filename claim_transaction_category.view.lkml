view: claim_transaction_category {
  sql_table_name: dbo.ClaimTransactionCategory ;;

  dimension: claimtransacationcategory_id {
    label: "Trans Type Code"
    primary_key: yes
    hidden: no
    type: number
    sql: ${TABLE}.claimtransactioncategory_id ;;
  }

  dimension: claimfinancialcategory_id {
    hidden: no
    type: number
    sql: ${TABLE}.claimfinancialcategory_id ;;
  }

  dimension: dscr {
    label: "Trans Type"
    type: string
    sql: ${TABLE}.dscr ;;
  }
}
