#!/bin/bash

# Script for updating workers queues should be used atleast on
# account-creator
# api
# api-fr
# dash
# mail-dispatcher
# payments
# py-heartbeat

typeset -A replacements
replacements=(
  ["hubspot"]="low_priority"
  ["acc_mailer"]="high_priority"
  ["async_jobs"]="high_priority"
  ["delete_sales_mails"]="low_priority"
  ["didi"]="medium_priority"
  ["didi"]="medium_priority"
  ["didi"]="medium_priority"
  ["ifood"]="medium_priority"
  ["ifood"]="medium_priority"
  ["ifood"]="medium_priority"
  ["ifood"]="medium_priority"
  ["ifood"]="medium_priority"
  ["justo"]="medium_priority"
  ["justo"]="medium_priority"
  ["mas_delivery"]="medium_priority"
  ["mercadopago"]="high_priority"
  ["notifier"]="low_priority"
  ["online_menu_mails"]="medium_priority"
  ["passwd_mails"]="medium_priority"
  ["pedidos_ya"]="medium_priority"
  ["py_heartbeat"]="low_priority"
  ["py_heartbeat"]="low_priority"
  ["notifier"]="low_priority"
  ["rappi"]="medium_priority"
  ["rappi"]="medium_priority"
  ["rappi"]="medium_priority"
  ["sales_report_mails"]="low_priority"
  ["uber_eats"]="medium_priority"
  ["uber_eats"]="medium_priority"
  ["uber_eats"]="medium_priority"
  ["users"]="high_priority"
  ["dlocal_pay"]="high_priority"
)

command=""
for replacement in "${!replacements[@]}"; do
  command=" -e s/'$replacement',/'${replacements[$replacement]}',/g $command"
done

find . -name "*.rb" -exec sed -i $command {} \;
