#!/bin/bash

group=arturresource
service_principal_name=${group}01
subscription=fda5667f-8bc9-499d-bcc3-4a3fbc11746e
# location=westeurope
location=eastus
tenant=8caad09b-4487-48f9-b7d6-b47e22b2dd2f

create_group() {
    set -x
    az group create \
        --name $group \
        --location $location \
        --subscription $subscription
    set +x
}
 
 
            # --scopes "/subscriptions/${subscription}/resourceGroups/${group}" \

create_group_service_principal() {
    sp_password=$(
        MSYS_NO_PATHCONV=1 az ad sp create-for-rbac \
            --name $service_principal_name \
            --scopes "/subscriptions/${subscription}" \
            --role owner \
            --query "password" \
            --output tsv
    )
    set -x
    sp_username=$(
        az ad sp list \
            --display-name $service_principal_name \
            --query "[].appId" \
            --output tsv
    )
    set +x
}

clean_up_azure_portal_resources() {
    set -x
    az group delete \
        --name $group \
        --yes \
        --subscription $subscription
    set +x
}
 
login() {
    set -x
    # sp_password=$(
    #     az ad sp credential reset --id $sp_username --query password -o tsv
    # )
    az login --service-principal -u $sp_username -p $sp_password --tenant $tenant

    while [[ $? -ne 0 ]]; do
        sleep 10 
        # response=$(az login --service-principal -u $sp_username -p $sp_password --tenant $tenant)
        az login --service-principal -u $sp_username -p $sp_password --tenant $tenant
    done
    set +x
}

create_group_service_principal
echo "_______________________"
echo "Username: $sp_username"
echo "Password: $sp_password"

# login

# Username: 887f7420-def1-416b-8c68-c8615dce4cbe
# Password: lYp8Q~BPaQbS9DDL4lpYJyOWyj0XpHTHndgeJcTJ