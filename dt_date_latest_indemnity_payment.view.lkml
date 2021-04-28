view: dt_date_latest_indemnity_payment {
  derived_table: {
    sql: SELECT claim_control.claimcontrol_id AS claimcontrol_id
              --SH 2020-06-18 - TT 302617 Added claimant_num and claimfeature_num to join in the model
              ,v_claim_detail_claimant.claimant_num as claimant_num
              ,v_claim_detail_feature.claimfeature_num as claimfeature_num
              --SH 2021-04-01 - TT 315226 Added added_date to measure days open to lastest indemnity date

              --SH 2021-04-21 - TT 315292 Replaced logic from TT 315226 since it's creating duplicates by grouping added_date
              --,claim_control.added_date as added_date
              ,min(claim_feature_activity.added_date) as added_date

              ,max(v_claim_detail_transaction.check_date) as max_check_date

      FROM dbo.ClaimControl  AS claim_control
      INNER JOIN dbo.vClaimDetail_Claimant  AS v_claim_detail_claimant ON claim_control.claimcontrol_id = v_claim_detail_claimant.claimcontrol_id
      LEFT JOIN dbo.vClaimDetail_Feature  AS v_claim_detail_feature ON v_claim_detail_claimant.claimcontrol_id = v_claim_detail_feature.claimcontrol_id
                    AND v_claim_detail_claimant.claimant_num = v_claim_detail_feature.claimant_num

      --SH 2021-04-21 - TT 315292 joining to table ClaimFeature to get the added_date (not in the view)
      --SH 2021-04-29 - TT 315292 Changed table from ClaimFeature to ClaimFeatureActivity so we get true open date
      --LEFT JOIN dbo.ClaimFeature  AS claim_feature ON v_claim_detail_feature.claimcontrol_id = claim_feature.claimcontrol_id
      --              AND v_claim_detail_feature.claimant_num = claim_feature.claimant_num
      --    AND v_claim_detail_feature.claimfeature_num = claim_feature.claimfeature_num
      LEFT JOIN dbo.ClaimFeatureActivity  AS claim_feature_activity ON v_claim_detail_feature.claimcontrol_id = claim_feature_activity.claimcontrol_id
                    AND v_claim_detail_feature.claimant_num = claim_feature_activity.claimant_num
                    AND v_claim_detail_feature.claimfeature_num = claim_feature_activity.claimfeature_num
                    AND claim_feature_activity.claimactivitycode_id = 1

      LEFT JOIN dbo.vClaimDetail_Transaction  AS v_claim_detail_transaction ON v_claim_detail_feature.claimcontrol_id = v_claim_detail_transaction.claimcontrol_id
                    AND v_claim_detail_feature.claimant_num = v_claim_detail_transaction.claimant_num
                    AND v_claim_detail_feature.claimfeature_num = v_claim_detail_transaction.claimfeature_num

      LEFT JOIN dbo.ClaimTransactionCategory  AS claim_transaction_category ON v_claim_detail_transaction.claimtransactioncategory_id = claim_transaction_category.claimtransactioncategory_id
      INNER JOIN dbo.CheckStatus  AS check_status ON v_claim_detail_transaction.checkstatus_id = check_status.checkstatus_id

      WHERE claim_transaction_category.dscr = 'Loss Payment'
        and v_claim_detail_transaction.check_number between 1 and 99999999
        and check_status.[description] <> 'Void'

      GROUP BY claim_control.claimcontrol_id
              ,v_claim_detail_claimant.claimant_num
              ,v_claim_detail_feature.claimfeature_num
              --SH 2021-04-01 - TT 315226 Added added_date to measure days open to lastest indemnity date
              ,claim_control.added_date
 ;;
  }

  dimension: claimcontrol_id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.claimcontrol_id ;;
  }

  dimension: claimant_num {
    hidden: yes
    type: number
    sql: ${TABLE}.claimant_num ;;
  }

  dimension: claimfeature_num {
    hidden: yes
    type: number
    sql: ${TABLE}.claimfeature_num ;;
  }

  dimension_group: added_date {
    hidden: yes
    type: time
    timeframes: [date]
    sql: ${TABLE}.added_date ;;
  }

  dimension_group: max_check_date {
    label: "Date of Latest Indemnity Payment"
    type: time
    timeframes: [date,month,year]
    sql: ${TABLE}.max_check_date ;;
    convert_tz: no
  }

  #SH 2021-04-01 Added data point with more tiers for MCAS reporting 23-28 TT 315226
  dimension: days_open_to_last_indeminity_payment {
    label: "Days to Last Indemnity Payment"
    type: number
    sql: case when ${max_check_date_date} IS NULL
      then NULL
      else DATEDIFF(dd, ${added_date_date}, ${max_check_date_date}) end  ;;
  }

  #SH 2021-04-01 Added data point with more tiers for MCAS reporting 23-28 TT 315226
  dimension : latest_indemnity_payment_within_more {
    type: tier
    label: "Last Indemnity Payment Within (More Tiers)"
    tiers: [31,61,91,181,366]
    style: integer
    sql: case when ${dt_date_latest_indemnity_payment.max_check_date_date} IS NULL
      then NULL
      else ${days_open_to_last_indeminity_payment} end ;;
    value_format: "0"
  }

}
