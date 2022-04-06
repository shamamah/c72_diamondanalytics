view: dm_claim_activity {
  sql_table_name: dbo.ClaimActivity ;;

  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.Id ;;
  }

  dimension: claim_id {
    hidden: yes
    type: number
    sql: ${TABLE}.ClaimId ;;
  }

  dimension: first_close_est {
    label: "Is First Close Estimate"
    type: string
    sql: case when ${TABLE}.FirstCloseEst=1 then 'Yes' else 'No' end ;;
  }

  #############
  ##  DATES  ##
  #############

  dimension_group: received_date {
    label: "01 Received"
    type: time
    timeframes: [date,time,month,quarter,year]
    sql: ${TABLE}.ReceivedDate ;;
  }

  dimension_group: assigned_date {
    label: "02 Assigned"
    type: time
    timeframes: [date,time,month,quarter,year]
    sql: ${TABLE}.AssignedDate ;;
  }

  dimension_group: accepted_date {
    label: "03 Accepted"
    type: time
    timeframes: [date,time,month,quarter,year]
    sql: ${TABLE}.AcceptedDate ;;
  }

  dimension_group: contact_date {
    label: "04 Contact"
    type: time
    timeframes: [date,time,month,quarter,year]
    sql: ${TABLE}.ContactDate ;;
  }

  dimension_group: inspection_date {
    label: "05 Inspection"
    type: time
    timeframes: [date,time,month,quarter,year]
    sql: ${TABLE}.InspectionDate ;;
  }

  dimension_group: first_report_date {
    label: "06 First Report"
    type: time
    timeframes: [date,time,month,quarter,year]
    sql: ${TABLE}.FirstReportDate ;;
  }

  dimension_group: adjustment_completed_date {
    label: "07 Adjustment Completion"
    type: time
    timeframes: [date,time,month,quarter,year]
    sql: ${TABLE}.AdjCompleteDate ;;
  }

  dimension_group: first_close_date {
    label: "08 Close (First)"
    type: time
    timeframes: [date,time,month,quarter,year]
    sql: ${TABLE}.FirstCloseDate ;;
  }

  dimension_group: re_open_date {
    label: "09 Re-open (Last)"
    type: time
    timeframes: [date,month,quarter,year]
    sql: ${TABLE}.ReOpenDate ;;
  }

  dimension_group: closed_date {
    label: "10 Closed (Last)"
    type: time
    timeframes: [date,month,quarter,year]
    sql: ${TABLE}.ClosedDate ;;
  }

  dimension_group: due_date {
    label: "Due"
    type: time
    timeframes: [date,month,quarter,year]
    sql: ${TABLE}.DueDate ;;
  }

  ###############
  ##  DATEDIFF ##
  ###############

  dimension: datediff_recevied_to_assigned {
    hidden: yes
    label: "20 Received to Assigned"
    type: number
    #sql: datediff(day, ${received_date_date}, ${assigned_date_date}) ;;
    sql: case when isnull(${accepted_date_time}, '1900-01-01') != '1900-01-01'
            then  (cast((datediff(minute,${received_date_time},${assigned_date_time})/60.) as decimal(12,2))/24)
            else 0
          end;;
    value_format_name: decimal_4
  }

  dimension: datediff_received_to_first_report {
    label: "Time: Received to First Report"
    type: number
    #sql: datediff(day, ${received_date_date}, ${assigned_date_date}) ;;
    sql: case when isnull(${first_report_date_time}, '1900-01-01') != '1900-01-01'
            then  (cast((datediff(minute,${received_date_time},${first_report_date_time})/60.) as decimal(12,2))/24)
            else 0
          end;;
    value_format_name: decimal_2
  }

  dimension: datediff_assigned_to_contact {
    label: "Time: Assigned to Contact"
    type: number
    #sql: datediff(day, ${received_date_date}, ${assigned_date_date}) ;;
    sql: case when isnull(${contact_date_time}, '1900-01-01') != '1900-01-01'
            then  (cast((datediff(minute,${assigned_date_time},${contact_date_time})/60.) as decimal(12,2))/24)
            else 0
          end;;
    value_format_name: decimal_2
  }

  dimension: datediff_assigned_to_inspection {
    label: "Time: Assigned to Inspection"
    type: number
    sql: case when isnull(${inspection_date_time}, '1900-01-01') != '1900-01-01'
            then  (cast((datediff(minute,${assigned_date_time},${inspection_date_time})/60.) as decimal(12,2))/24)
            else 0
          end;;
    value_format_name: decimal_2
  }

  dimension: datediff_assigned_to_accepted {
    hidden: yes
    label: "21 Assigned to Accepted"
    type: number
    sql: datediff(day, ${assigned_date_date}, ${accepted_date_date}) ;;
    value_format_name: decimal_0
  }

  dimension: datediff_accepted_to_contact {
    hidden: yes
    label: "22 Accepted to Contact"
    type: number
    sql: datediff(day, ${accepted_date_date}, ${contact_date_date}) ;;
    value_format_name: decimal_0
  }

  dimension: datediff_contact_to_inspection {
    hidden: yes
    label: "23 Contact to Inspection"
    type: number
    sql: datediff(day, ${contact_date_date}, ${inspection_date_date}) ;;
    value_format_name: decimal_0
  }

  dimension: datediff_inspection_to_first_report {
    hidden: yes
    label: "24 Inspection to First Report"
    type: number
    sql: datediff(day, ${inspection_date_date}, ${first_close_date_date}) ;;
    value_format_name: decimal_0
  }

  dimension: datediff_first_report_to_complete {
    hidden: yes
    label: "25 First Report to Complete"
    type: number
    sql: datediff(day, ${first_close_date_date}, ${adjustment_completed_date_date}) ;;
    value_format_name: decimal_0
  }

  dimension: datediff_assigned_to_first_close {
    label: "Time: Assigned to Close"
    type: number
    sql: case when isnull(${assigned_date_date}, '1900-01-01') != '1900-01-01' and isnull(${first_close_date_date}, '1900-01-01') != '1900-01-01'
            then  (cast((datediff(minute,${assigned_date_time},${first_close_date_time})/60.) as decimal(12,2))/24)
            else 0
          end;;
    value_format_name: decimal_2
  }

  dimension: datediff_complete_to_first_close {
    label: "Time: Complete to Close"
    type: number
    sql: case when isnull(${adjustment_completed_date_date}, '1900-01-01') != '1900-01-01' and isnull(${first_close_date_date}, '1900-01-01') != '1900-01-01'
            then  (cast((datediff(minute,${adjustment_completed_date_time},${first_close_date_time})/60.) as decimal(12,2))/24)
            else 0
          end;;
    value_format_name: decimal_2
  }


  dimension: datediff_first_close_to_reopen {
    hidden: yes
    label: "27 First Close to ReOpen"
    type: number
    sql: datediff(day, ${first_close_date_date}, ${re_open_date_date}) ;;
    value_format_name: decimal_0
  }


  ###############
  ##  AVERAGE  ##
  ###############

  measure: ave_assigned_to_contact {
    label: "Average Duration: Assigned To 1st Contact"
    type: average
    sql: ${datediff_assigned_to_contact} ;;
    value_format_name: decimal_2
    filters: {
      field: contact_date_date
      value: "-NULL"
    }
    filters: {
      field: datediff_assigned_to_contact
      value: ">0"
    }
    drill_fields: [dm_claim.duration_drill*]
  }

  measure: ave_received_to_first_report {
    label: "Average Duration: Received  To 1st Report"
    type: average
    sql: ${datediff_received_to_first_report} ;;
    value_format_name: decimal_2
    filters: {
      field: first_report_date_date
      value: "-NULL"
    }
    filters: {
      field: datediff_received_to_first_report
      value: ">0"
    }
    drill_fields: [dm_claim.duration_drill*]
  }

  measure: ave_assigned_to_inspection {
    label: "Average Duration: Assigned To Inspection"
    type: average
    sql: ${datediff_assigned_to_inspection} ;;
    value_format_name: decimal_2
    filters: {
      field: inspection_date_date
      value: "-NULL"
    }
    filters: {
      field: datediff_assigned_to_inspection
      value: ">0"
    }
    drill_fields: [dm_claim.duration_drill*]
  }

  measure: ave_assign_to_close {
    label: "Average Duration: Assigned To Close"
    type: average
    sql: ${datediff_assigned_to_first_close} ;;
    value_format_name: decimal_2
    filters: {
      field: assigned_date_date
      value: "-NULL"
    }
    filters: {
      field: first_close_date_date
      value: "-NULL"
    }
    filters: {
      field: datediff_assigned_to_first_close
      value: ">0"
    }
    drill_fields: [dm_claim.duration_drill*]
  }

  measure: ave_complete_to_close {
    label: "Average Duration: QA Time"
    type: average
    sql: ${datediff_complete_to_first_close} ;;
    value_format_name: decimal_2
    filters: {
      field: adjustment_completed_date_date
      value: "-NULL"
    }
    filters: {
      field: first_close_date_date
      value: "-NULL"
    }
    filters: {
      field: datediff_complete_to_first_close
      value: ">0"
    }
    drill_fields: [dm_claim.duration_drill*]
  }

  ############
  ##  TIME  ##
  ############

  dimension: time_to_assign {
    hidden: yes
    label: "Time to Assign"
    type: number
    sql: ${TABLE}.TimeToAssign ;;
  }

  dimension: time_to_accept {
    hidden: yes
    label: "Time to Accept"
    type: number
    sql: ${TABLE}.TimeToAccept ;;
  }

  dimension: time_to_contact {
    hidden: yes
    label: "Time to Contact"
    type: number
    sql: ${TABLE}.TimeToContact ;;
  }

  dimension: time_to_inspect {
    hidden: yes
    label: "Time to Inspect"
    type: number
    sql: ${TABLE}.TimeToInspect ;;
  }

  dimension: time_to_first_report {
    hidden: yes
    label: "Time to First Report"
    type: number
    sql: ${TABLE}.TimeToFirstReport ;;
  }

  dimension: time_to_complete {
    hidden: yes
    label: "Time to Complete"
    type: number
    sql: ${TABLE}.TimeToComplete ;;
  }

  dimension: time_allocated {
    hidden: yes
    label: "Time Allocated"
    type: number
    sql: ${TABLE}.TimeAllocated ;;
  }


  ################
  ##  DURATION  ##
  ################

  dimension: duration_to_assign {
    hidden: yes
    label: "1 Duration to Assign"
    type: number
    sql: ${TABLE}.DurationToAssign ;;
    value_format_name: decimal_4
  }

  dimension: duration_to_accept {
    hidden: yes
    label: "2 Duration to Accept"
    type: number
    sql: ${TABLE}.DurationToAccept ;;
    value_format_name: decimal_4
  }

  dimension: duration_to_contact {
    hidden: yes
    label: "3 Duration to Contact"
    type: number
    sql: ${TABLE}.DurationToContact ;;
    value_format_name: decimal_4
  }

  dimension: duration_to_inspect {
    hidden: yes
    label: "4 Duration to Inspect"
    type: number
    sql: ${TABLE}.DurationToInspect ;;
    value_format_name: decimal_4
  }

  dimension: duration_to_first_report {
    hidden: yes
    label: "5 Duration to First Report"
    type: number
    sql: ${TABLE}.DurationToFirstReport ;;
    value_format_name: decimal_4
  }

  dimension: duration_to_adjust {
    hidden: yes
    label: "6 Duration to Adjust"
    type: number
    sql: ${TABLE}.DurationToAdjust ;;
    value_format_name: decimal_4
  }

  dimension: duration_allocated {
    hidden: yes
    label: "9 Duration Allocated"
    type: number
    sql: ${TABLE}.DurationAllocated ;;
    value_format_name: decimal_4
  }

  dimension: duration_to_first_close {
    hidden: yes
    label: "7 Duration to First Close"
    type: number
    sql: ${TABLE}.DurationToFirstClose ;;
    value_format_name: decimal_4
  }

  dimension: hours_since_last_update {
    hidden: yes
    label: "Hours Since Last Update"
    type: number
    sql: ${TABLE}.HoursSinceLastUpdate ;;
    value_format_name: decimal_4
  }

########################
##                    ##
########################

  dimension: days_open {
    hidden: yes
    view_label: "Claim"
    label: "First Days Open"
    type: number
    sql: --case when trim(${dm_claim.claim_closed})='No'   TRIM does not work in SQL Server 2016, need LTRIM(RTRIM())
         case when ${dm_claim.claim_closed}='No'
          then DATEDIFF(dd, ${received_date_date}, GetDate())
          else DATEDIFF(dd, ${received_date_date}, ${closed_date_date}) end  ;;
      #--case when ${first_close_date_date} IS NULL
    }

    dimension : days_open_tier {
      view_label: "Claim"
      label: "Days Open (Tiers)"
      type: tier
      tiers: [31,61,91]
      style: integer
      sql: ${days_open} ;;
      value_format: "0"
    }

  }
