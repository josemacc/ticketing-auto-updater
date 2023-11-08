#!/bin/bash

$(git pull --force > a.txt)
# Ejecutar git pull y filtrar la salida con grep
if (tail -n 100 a.txt | grep -qi "updating") || (tail -n 100 a.txt | grep -qi "actualizando") ; then
        # Ejecutar comandos adicionales
        echo "Actualizando..."
        # Fetched new data, unzip the file
        unzip tolls-ticketing-api_py3.8.10_release.zip
        unzip dist-tolls-ticketing.zip
        # Rename the unzipped folder
        mv release-tolls-ticketing-api ticketing-machine
        mv dist ticketing-www
        # Run a Python file
        python3 ticketing-updater.py
        # Delete the folder
        rm -rf ticketing-machine
        rm -rf ticketing-www
        
fi
