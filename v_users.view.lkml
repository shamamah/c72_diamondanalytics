view: v_users {
  sql_table_name: dbo.vUsers ;;

  dimension: users_id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.users_id ;;
  }

#   dimension: acd_adjuster_code {
#     type: string
#     sql: ${TABLE}.acd_adjuster_code ;;
#   }

  dimension: active {
    label: "Active (Yes/No)"
    type: yesno
    sql: ${TABLE}.active ;;
  }

#   dimension_group: added {
#     type: time
#     timeframes: [
#       raw,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     convert_tz: no
#     datatype: date
#     sql: ${TABLE}.added_date ;;
#   }

#   dimension: associate_user_with_all_agencies {
#     type: string
#     sql: ${TABLE}.associate_user_with_all_agencies ;;
#   }
#
#   dimension: claimsdashboardtemplate_id {
#     type: number
#     sql: ${TABLE}.claimsdashboardtemplate_id ;;
#   }

  dimension: display_name {
    label: "Display Name"
    type: string
    sql: ${TABLE}.display_name ;;
  }

#   dimension: failed_login_attempt_count {
#     type: number
#     sql: ${TABLE}.failed_login_attempt_count ;;
#   }
#
#   dimension: initials {
#     type: string
#     sql: ${TABLE}.initials ;;
#   }
#
#   dimension: is_external_user {
#     type: string
#     sql: ${TABLE}.is_external_user ;;
#   }
#
#   dimension: is_locked {
#     type: string
#     sql: ${TABLE}.is_locked ;;
#   }
#
#   dimension_group: last_failed_login {
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}.last_failed_login_date ;;
#   }
#
#   dimension_group: last_modified {
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}.last_modified_date ;;
#   }

  dimension: last_name {
    hidden: yes
    label: "Last Name"
    type: string
    sql: ${TABLE}.last_name ;;
  }

#   dimension_group: last_successful_login {
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}.last_successful_login_date ;;
#   }
#
#   dimension: login_domain {
#     type: string
#     sql: ${TABLE}.login_domain ;;
#   }
#
#   dimension: login_name {
#     type: string
#     sql: ${TABLE}.login_name ;;
#   }
#
#   dimension: mitchell_adjuster_code {
#     type: string
#     sql: ${TABLE}.mitchell_adjuster_code ;;
#   }

  dimension: name_id {
    type: number
    sql: ${TABLE}.name_id ;;
  }

#   dimension: notifyuw {
#     type: string
#     sql: ${TABLE}.notifyuw ;;
#   }
#
#   dimension: password {
#     type: string
#     sql: ${TABLE}.password ;;
#   }
#
#   dimension_group: password_expires {
#     type: time
#     timeframes: [
#       raw,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     convert_tz: no
#     datatype: date
#     sql: ${TABLE}.password_expires_date ;;
#   }
#
#   dimension: password_must_be_changed {
#     type: string
#     sql: ${TABLE}.password_must_be_changed ;;
#   }
#
#   dimension: password_salt {
#     type: string
#     sql: ${TABLE}.password_salt ;;
#   }
#
#   dimension: passwordhashtype_id {
#     type: number
#     sql: ${TABLE}.passwordhashtype_id ;;
#   }
#
#   dimension_group: pcadded {
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}.pcadded_date ;;
#   }
#
#   dimension: suid {
#     type: string
#     sql: ${TABLE}.suid ;;
#   }
#
#   dimension: supervisor {
#     type: string
#     sql: ${TABLE}.supervisor ;;
#   }
#
#   dimension: use_claimsdashboard_as_startup {
#     type: string
#     sql: ${TABLE}.use_claimsdashboard_as_startup ;;
#   }
#
#   dimension: user_code {
#     type: string
#     sql: ${TABLE}.user_code ;;
#   }
#
#   dimension: user_emailaddr {
#     type: string
#     sql: ${TABLE}.user_emailaddr ;;
#   }
#
#   dimension: usercategory_id {
#     type: number
#     sql: ${TABLE}.usercategory_id ;;
#   }

#   measure: count {
#     type: count
#     drill_fields: [display_name, login_name, last_name]
#   }
}
