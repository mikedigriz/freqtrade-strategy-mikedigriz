#!/bin/bash

# collect all active pairs from differ db and running bots

sqlite3 -header -csv bbrsi_new_optimize.sqlite "select pair,open_trade_value from trades where exit_order_status is NULL;" > export_db.csv
sqlite3 -csv HMA_val_fast.sqlite "select pair,open_trade_value from trades where exit_order_status is NULL;" >> export_db.csv
