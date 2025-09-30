#!/bin/bash

DB_USER="almacen1234"
DB_PASS="4321almacen"


mysql -u"$DB_USER" -p"$DB_PASS"  < script_db_prod.sql
