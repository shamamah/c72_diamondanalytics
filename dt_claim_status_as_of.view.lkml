view: dt_claim_status_as_of {
  derived_table: {
    sql: SELECT cc.claimcontrol_id, cca.added_date, CASE CCA.claimactivitycode_id
              WHEN 1 THEN 'Open'
              WHEN 2 THEN 'Closed'
              END AS claim_status
          FROM dbo.ClaimControl CC (NOLOCK)
            INNER JOIN dbo.ClaimControlActivity CCA (NOLOCK)
              ON CC.claimcontroL_id = CCA.claimcontrol_id
                  AND num = (SELECT MAX(num)
                        FROM dbo.ClaimControlActivity CCA2 (NOLOCK)
                        WHERE CCA2.claimcontrol_id = CCA.claimcontrol_id
                           AND CCA2.claimactivitycode_id IN (1, 2) -- open, closed
                           --AND added_date < '2018-09-01'
                           AND {% condition dt_claim_transactions_as_of.as_of_date %} cca2.added_date {% endcondition %}
                          )
      ;;
  }

  # filter: as_of_date {
  #   type: date
  #   hidden: yes
  #   label: "As of Date"
  # }

  dimension: claimcontrol_id {
    primary_key: yes
    hidden: yes
    type: number
    sql:  ${TABLE}.claimcontrol_id ;;
  }

  dimension: added_date {
    hidden: yes
    type: date
    sql: ${TABLE}.added_date ;;
  }

  dimension: claim_status {
    type: string
    label: "Status"
    sql: ${TABLE}.claim_status ;;
  }

}
