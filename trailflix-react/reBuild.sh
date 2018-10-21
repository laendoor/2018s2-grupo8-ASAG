#!/bin/bash 

echo [ReBuild] - borrar la cache
npm cache clean --force

echo [ReBuild] - eliminamos la carpeta node_modules
rm -rf node_modules

echo [ReBuild] - instalamos dependencias
npm install

echo [ReBuild] - levantamos el proyecto
npm start

