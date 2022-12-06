#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

# get available services
AVAILABLE_SERVISES=$($PSQL "SELECT * FROM services ORDER BY service_id")
# if no services available
if [[ -z $AVAILABLE_SERVISES ]]
then
  echo -e "\nSorry, we don't have any services available right now."
else
  # display available services
  echo -e "\nHere are the services we have available:"
  echo "$AVAILABLE_SERVISES" | while read SERVICE_ID BAR SERVICE_NAME
    do
      echo "$SERVICE_ID) $SERVICE_NAME"
    done
fi  
