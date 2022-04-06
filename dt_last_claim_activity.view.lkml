view: dt_last_claim_activity {
  derived_table: {
    sql: SELECT cc.claimcontrol_id
        ,cc.last_modified_date as Claim
        ,(select max(c.last_modified_date) from claimant c where c.claimcontrol_id = cc.claimcontrol_id) as Claimant
        ,(select max(cf.last_modified_date) from ClaimFeature cf where cf.claimcontrol_id = cc.claimcontrol_id) as Claim_Feature
        ,(select max(ct.last_modified_date) from ClaimTransaction ct where ct.claimcontrol_id = cc.claimcontrol_id) as Claim_Transaction
        ,(select max(cca.last_modified_date) from ClaimControlActivity cca where cca.claimcontrol_id = cc.claimcontrol_id) as Claim_Activity
        ,(select max(ca.last_modified_date) from ClaimantActivity ca where ca.claimcontrol_id = cc.claimcontrol_id) as Claimant_Activity
        ,(select max(ctp.last_modified_date) from ClaimTransactionPayee ctp where ctp.claimcontrol_id = cc.claimcontrol_id) as Trans_Payee
        ,(select max(ccal.last_modified_date) from ClaimControlAttachmentLink ccal where ccal.claimcontrol_id = cc.claimcontrol_id) as attachment_link
        --,(select max(n.pcadded_date) from vnotes n where n.create_key = cc.claimcontrol_id) as notes
        ,(SELECT max(n.pcadded_date) from NotesKeyLink NKL INNER JOIN vNotes N (NOLOCK) ON N.note_id = NKL.note_Id WHERE NKL.key_value > 0 AND NKL.Key_Value = cc.claimcontrol_id) as notes
        ,(SELECT MAX(MaxDate) FROM
          (
          SELECT MAX(last_modified_date) AS MaxDate FROM ClaimControl WHERE claimcontrol_id = cc.claimcontrol_id
          UNION
          SELECT MAX(last_modified_date) AS MaxDate FROM Claimant WHERE claimcontrol_id = cc.claimcontrol_id
          UNION
          SELECT MAX(last_modified_date) AS MaxDate FROM ClaimFeature WHERE claimcontrol_id = cc.claimcontrol_id
          UNION
          SELECT MAX(last_modified_date) AS MaxDate FROM ClaimTransaction WHERE claimcontrol_id = cc.claimcontrol_id
          UNION
          SELECT MAX(last_modified_date) AS MaxDate FROM ClaimControlActivity WHERE claimcontrol_id = cc.claimcontrol_id
          UNION
          SELECT MAX(last_modified_date) AS MaxDate FROM ClaimTransactionPayee WHERE claimcontrol_id = cc.claimcontrol_id
          UNION
          SELECT MAX(last_modified_date) AS MaxDate FROM ClaimControlAttachmentLink WHERE claimcontrol_id = cc.claimcontrol_id
          --UNION
          --SELECT MAX(pcadded_date) AS MaxDate FROM vNotes WHERE create_key = cc.claimcontrol_id
          UNION
          SELECT MAX(n.pcadded_date) AS MaxDate FROM NotesKeyLink NKL INNER JOIN vNotes N (NOLOCK) ON N.note_id = NKL.note_Id WHERE NKL.key_value > 0 AND NKL.Key_Value = cc.claimcontrol_id
          ) AS X) AS 'OverallLastModifiedDate'
      FROM ClaimControl cc
       ;;
  }

  dimension: claimcontrol_id {
    hidden: yes
    type: number
    sql: ${TABLE}.claimcontrol_id ;;
  }

  dimension_group: claim {
    hidden: yes
    type: time
    sql: ${TABLE}.Claim ;;
  }

  dimension_group: claimant {
    hidden: yes
    type: time
    sql: ${TABLE}.Claimant ;;
  }

  dimension_group: claim_feature {
    hidden: yes
    type: time
    sql: ${TABLE}.Claim_Feature ;;
  }

  dimension_group: claim_transaction {
    hidden: yes
    type: time
    sql: ${TABLE}.Claim_Transaction ;;
  }

  dimension_group: claim_activity {
    hidden: yes
    type: time
    sql: ${TABLE}.Claim_Activity ;;
  }

  dimension_group: claimant_activity {
    hidden: yes
    type: time
    sql: ${TABLE}.Claimant_Activity ;;
  }

  dimension_group: trans_payee {
    hidden: yes
    type: time
    sql: ${TABLE}.Trans_Payee ;;
  }

  dimension_group: attachment_link {
    hidden: yes
    type: time
    sql: ${TABLE}.Attachment_Link ;;
  }

  dimension_group: notes {
    hidden: yes
    type: time
    sql: ${TABLE}.Notes ;;
  }

  dimension_group: overall_last_modified_date {
    label: "Last Acitivity/Update"
    type: time
    timeframes: [date,week,month,quarter,year,time]
    sql: ${TABLE}.OverallLastModifiedDate ;;
  }
}
