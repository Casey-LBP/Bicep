param networkSecurityGroups_MS_EA_EDA_01_nsg_name string = 'MS-EA-EDA-01-nsg'
param location string = 'eastus'

resource networkSecurityGroups_MS_EA_EDA_01_nsg_name_resource 'Microsoft.Network/networkSecurityGroups@2020-11-01' = {
  name: networkSecurityGroups_MS_EA_EDA_01_nsg_name
  location: location
  properties: {
    securityRules: []
  }
}
