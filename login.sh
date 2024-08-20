#!/bin/bash

echo "OkONTCGFX/UvwVrr2d7Am+PjEEWJZG24vuDsw8UmDH+ACRA5TF3w" | docker login artursreg.azurecr.io -u artursreg --password-stdin


az login -u ${{ secrets.AZURE_LOGIN_USERNAME }} -p ${{ secrets.AZURE_LOGIN_PASSWORD }} --tenant ${{ secrets.AZURE_TENANT_ID }}

az login --service-principal -u ${{ secrets.AZURE_LOGIN_USERNAME }} -p ${{ secrets.AZURE_LOGIN_PASSWORD }} --tenant ${{ secrets.AZURE_TENANT_ID }}

- name: Log in to Azure
      run: |
        az account set --subscription ${{ secrets.AZURE_SUBSCRIPTION_ID }}


az login --service-principal -u $sp_username -p $sp_password --tenant 8caad09b-4487-48f9-b7d6-b47e22b2dd2f