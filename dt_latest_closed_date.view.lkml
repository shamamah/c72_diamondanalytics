view: dt_latest_closed_date {
  derived_table: {
    sql: SELECT claimcontrol_id, min(opened) as earliest_opened_date, max(closed) as latest_closed_date

      FROM (

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
            ) a

      Group by claimcontrol_id
       ;;
  }

  dimension: claimcontrol_id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.claimcontrol_id ;;
  }

  dimension_group: earliest_opened_date {
    hidden: yes
    label: "Earliest Open Date"
    type: time
    timeframes: [date,month,year]
    sql: ${TABLE}.earliest_opened_date ;;
  }

  dimension_group: latest_closed_date{
  label: "Latest Closed"
    type: time
    timeframes: [date,month,year]
    sql: ${TABLE}.latest_closed_date ;;
  }

  dimension: latest_closed_days {
    label: "Days to Latest Close"
    type: number
    sql: case when ${latest_closed_date_date} IS NULL
      then NULL
      else DATEDIFF(dd, ${earliest_opened_date_date}, ${latest_closed_date_date}) end  ;;
  }

  dimension : latest_closed_within {
    type: tier
    label: "Latest Closed Within (Tiers)"
    tiers: [31,61,91,181,366]
    style: integer
    sql: case when ${latest_closed_days} IS NULL
      then NULL
      else ${latest_closed_days} end ;;
    value_format: "0"
  }


}
