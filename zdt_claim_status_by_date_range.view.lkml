view: zdt_claim_status_by_date_range {
  derived_table: {
    sql:  SELECT claimcontrol_id, added_date,
            CASE CCA.claimactivitycode_id
              WHEN 1 THEN 'Open'
              WHEN 2 THEN 'Closed'
            END AS claim_status
          FROM dbo.ClaimControlActivity CCA (NOLOCK)
          WHERE num = (SELECT MAX(num)
                        FROM dbo.ClaimControlActivity CCA2 (NOLOCK)
                        WHERE CCA2.claimcontrol_id = CCA.claimcontrol_id
                           AND CCA2.claimactivitycode_id IN (1, 2) -- open, closed
                           --AND added_date <= @end_date
                          AND {% condition eff_date %} cca.added_date {% endcondition %}
                       )
    ;;
  }

  filter: eff_date {
    type: date
    label: "As of Date Range"
  }

  dimension: claimcontrol_id {
    hidden: yes
    type: number
    sql: ${TABLE}.claimcontrol_id ;;
  }

  dimension: added_date {
    hidden: yes
    type: date
    sql: ${TABLE}.added_date ;;
  }

  dimension: claim_status {
    label: "Status"
    type: string
    sql: ${TABLE}.claim_status ;;
  }
}
