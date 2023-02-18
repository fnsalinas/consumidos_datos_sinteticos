#!/bin/bash

# Guarda la fecha/hora en una variable
fecha=$(date +"%Y-%m-%d %H:%M:%S")

# Ask for the Commit message and save it in a variable
echo "Introduce el mensaje del commit y pulsa [ENTER]:"
read mensaje

# Si no se introduce mensaje, se pone uno por defecto
if [ -z "$mensaje" ]
then
    mensaje="Commit automatico"
fi

cd ~/workspace/fsalinas/consumidos_datos_sinteticos

git status;
git add .;
git commit -m "$mensaje $fecha COT";
git push;
