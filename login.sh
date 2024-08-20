#!/bin/bash

echo "OkONTCGFX/UvwVrr2d7Am+PjEEWJZG24vuDsw8UmDH+ACRA5TF3w" | docker login artursreg.azurecr.io -u artursreg --password-stdin


az login -u ${{ secrets.AZURE_LOGIN_USERNAME }} -p ${{ secrets.AZURE_LOGIN_PASSWORD }} --tenant ${{ secrets.AZURE_TENANT_ID }}

az login --service-principal -u ${{ secrets.AZURE_LOGIN_USERNAME }} -p ${{ secrets.AZURE_LOGIN_PASSWORD }} --tenant ${{ secrets.AZURE_TENANT_ID }}