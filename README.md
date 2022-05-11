# Bicep

#########################################
# HOW TO USE THIS 
#########################################

# 1.download ARM templates

# 2. decompile from ARM to Bicep
az bicep decompile --file template.json

# 3. create a resource group
az group create --resource-group test --location east us 

# Build a Bicep file and print all output to stdout.
# you can build a specific template or run the entire buy main.bicep 
az bicep build --file main.bicep --stdout
