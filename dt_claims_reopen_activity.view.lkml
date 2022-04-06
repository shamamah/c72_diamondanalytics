view: dt_claims_reopen_activity {
  derived_table: {
    sql:

    SELECT O.claimcontrol_id, ROW_NUMBER() OVER (PARTITION BY O.claimcontrol_id ORDER BY O.num) AS num, O.added_date AS opened, C.added_date AS closed, C.dscr
      FROM
      (
        SELECT claimcontrol_id, num, added_date, ROW_NUMBER() OVER (PARTITION BY claimcontrol_id ORDER BY num) AS RN
        FROM dbo.ClaimControlActivity
        WHERE claimactivitycode_id = 1
          AND {% condition dt_claim_transactions_as_of.as_of_date %} added_date {% endcondition %}
      ) O
      LEFT OUTER JOIN
      (
        SELECT claimcontrol_id, num, added_date, dscr, ROW_NUMBER() OVER (PARTITION BY claimcontrol_id ORDER BY num) AS RN
        FROM dbo.ClaimControlActivity
        WHERE claimactivitycode_id = 2
      ) C
        ON C.claimcontrol_id = O.claimcontrol_id
          AND C.RN = O.RN
       ;;
  }

  dimension: compound_primary_key {
    type: string
    primary_key: yes
    hidden: yes
    sql: CONCAT(${claimcontrol_id},${num}) ;;
  }

  dimension: claimcontrol_id {
    hidden: yes
    type: number
    sql: ${TABLE}.claimcontrol_id ;;
  }

  dimension: num {
    hidden: yes
    type: number
    sql: ${TABLE}.num ;;
  }

  dimension_group: re_open_date {
    label: "Re-Open"
    type: time
    timeframes: [date]
    sql: ${TABLE}.opened ;;
  }

  dimension_group: re_close_date {
    label: "Re-Close"
    type: time
    timeframes: [date]
    sql: ${TABLE}.closed ;;
  }

  dimension: close_reason {
    label: "Re-Close Reason"
    type: string
    sql: ${TABLE}.dscr ;;
  }

  dimension: days_reopen {
    label: "Re-Open Days"
    type: number
    sql: case when ${re_close_date_date} IS NULL
      then NULL
      else DATEDIFF(dd, ${re_open_date_date}, ${re_close_date_date}) end ;;
  }

}
