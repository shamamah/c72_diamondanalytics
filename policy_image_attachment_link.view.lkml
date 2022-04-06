view: policy_image_attachment_link {
  sql_table_name: dbo.PolicyImageAttachmentLink ;;

  dimension: attachment_id {
    type: number
    hidden: yes
    primary_key: yes
    sql: ${TABLE}.attachment_id ;;
  }

  dimension: policy_id {
    type: number
    hidden: yes
    sql: ${TABLE}.policy_id ;;
  }

  dimension: policyimage_num {
    type: number
    hidden: yes
    sql: ${TABLE}.policyimage_num ;;
  }

  measure: count {
    label: "Attachment Count"
    type: count
    drill_fields: [attachment_id]
  }
}
