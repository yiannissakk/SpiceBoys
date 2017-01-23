#!/bin/sh

NO_USERS=$1

NO_ORDERS=$2

NO_WEB_EVENTS=$3

python create_order_details_table.py $NO_ORDERS
python create_users_table.py $NO_USERS
python genWebEvents.py $NO_WEB_EVENTS
python ordersTable.py $NO_USERS $NO_ORDERS
python productsTable.py

