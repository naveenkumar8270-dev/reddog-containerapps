# *nix only
export RG="reddog"
export LOCATION="mortheurope>
export SUB_ID="1adcbc08-e76c-4dcf-8bc4-7b917a30641f"

# Follow Azure CLI prompts to authenticate to your subscription of choice
az login
az account set --subscription $SUB_ID

# Create resource group
az group create -n $RG -l $LOCATION

# Deploy all infrastructure and reddog apps
az deployment group create -n reddog -g $RG -f ./deploy/bicep/main.bicep

# Show outputs for bicep deployment
az deployment group show -n reddog -g $RG -o json --query properties.outputs.urls.value
