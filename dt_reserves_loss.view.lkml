view: dt_reserves_loss {
  derived_table: {
    sql: SELECT cc.claimcontrol_id
           ,CASE WHEN ct.claimcontrol_id IS NOT NULL THEN 'Yes'
                    ELSE 'No'
             END AS 'reserve_set'
           ,SUM(ct.amount) as Reserve_Amount
      FROM dbo.ClaimControl cc

      LEFT OUTER JOIN
      (
            select ct2.claimcontrol_id as claimcontrol_id, ct2.amount as amount
            FROM dbo.ClaimTransaction ct2 WITH (NOLOCK)
            WHERE ct2.claimtransactioncategory_id IN (1)  /*reserve changes 1=Loss, 3=AO, 13=DCC*/
              AND ct2.amount > 0.00                       /*only reserve changes > 0*/
              AND ct2.claimtransactionstatus_id <> 5      /*5=rejected*/
              --AND {% condition dt_claim_transactions_as_of.as_of_date %} ct.added_date {% endcondition %}
      ) ct
             ON cc.claimcontrol_id = ct.claimcontrol_id

      GROUP BY Cc.claimcontrol_id
           ,CASE WHEN ct.claimcontrol_id IS NOT NULL THEN 'Yes'
                    ELSE 'No'
             END  ;;
  }

  dimension: claimcontrol_id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.claimcontrol_id ;;
  }

  dimension: reserve_set {
    label: "Loss Reserve Set (Yes/No)"
    type: string
    sql: ${TABLE}.reserve_set ;;
  }

  dimension: dim_reserve_amount {
    hidden: yes
    type: number
    sql: ${TABLE}.reserve_amount ;;
  }

  measure: reserve_amount {
    label: "Loss Reserve Amount"
    type: sum
    sql: ${dim_reserve_amount} ;;
    value_format_name: usd
  }
}
