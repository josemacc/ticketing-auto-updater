#!/bin/sh

# Security
export "ALLOWED_HOSTS=api.ticketing-local.com www.ticketing-local.com"
export "CSRF_TRUSTED_ORIGINS=www.ticketing-local.com"
export "CORS_ORIGIN_WHITELIST=http://www.ticketing-local.com"

# Config files
export "MODULES_FILE=modules.json"

# Var (Logs and sessions)
export "LOGGING_LEVEL=INFO"
export "LOG_DIRECTORY=/opt/ticketing-var/log"
export "SESSIONS_PATH=/opt/ticketing-var/sessions"
export "TEMPLATE_CAMERA_PATH=/opt/ticketing-www/camera/"

#Camera
export "CAMERA_URL=rtsp://admin:rseadmin1234@192.168.10.41:554/cam/realmonitor?channel=1&subtype=0"
export "DISABLE_LICENCE_PLATE_CAMERA=0"

# Regional API
export "REGIONAL_API_URL=http://api.regional-occidente-prod.vpn:9088/api"

# RDS
export "RDS_SQLITE3=/opt/ticketing-var/tolls-ticketing.db"

# Node Info
export "NODE_TYPE=ticketing-machine"
export "NODE_CODE=001242000001"
export "COMPANY_CODE=1111100001001"
export "COMPANY_LOGO=FONTUR_logo.png"
export "COMPANY_RIF=G-20006289-4"

# App
export "DJANGO_SETTINGS_MODULE=tolls_ticketing_proj.settings"

# Deferred calls 
export "DEFERRED_API_USER=deferred_nodes_taguanes"
export "DEFERRED_API_PASSW=23-88776654=17"

# Restart Command
export "RESTART_COMMAND=sudo usr/bin/systemctl reload apache2"


export "REMOTE_API_URL=http://api.regional-occidente-prod.vpn:9088/api"
export "PATH=$PATH:/opt/ticketing-machine:/opt/ticketing-machine/tolls_ticketing_proj"

cd /opt/ticketing-machine
/opt/ticketing-var/venv38/bin/python3.8 tolls_ticketing_proj/manage.pyc $1 $2 $3 $4 $5
