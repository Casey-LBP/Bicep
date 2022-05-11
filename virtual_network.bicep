param virtualNetworks_c1cd1f84_007f_4ceb_bdfd_2b45cf80dedb_name string = 'c1cd1f84-007f-4ceb-bdfd-2b45cf80dedb'
param location string = 'eastus'
param addressPrefixes string = '10.0.0.0/16'
param name string = 'AL_FTD_temp'
param addressPrefix string = '10.0.0.0/24'
param privateEndpointNetworkPolicies string = 'Enabled'
param privateLinkServiceNetworkPolicies string = 'Enabled'
param enableDdosProtection bool = false


resource virtualNetworks_c1cd1f84_007f_4ceb_bdfd_2b45cf80dedb_name_resource 'Microsoft.Network/virtualNetworks@2020-11-01' = {
  name: virtualNetworks_c1cd1f84_007f_4ceb_bdfd_2b45cf80dedb_name
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        addressPrefixes
      ]
    }
    subnets: [
      {
        name: name
        properties: {
          addressPrefix: addressPrefix
          delegations: [
            {
              name: 'Microsoft.ContainerInstance/containerGroups'
              properties: {
                serviceName: 'Microsoft.ContainerInstance/containerGroups'
              }
            }
          ]
          privateEndpointNetworkPolicies: privateEndpointNetworkPolicies
          privateLinkServiceNetworkPolicies: privateLinkServiceNetworkPolicies
        }
      }
    ]
    virtualNetworkPeerings: []
    enableDdosProtection: enableDdosProtection
  }
}

resource virtualNetworks_c1cd1f84_007f_4ceb_bdfd_2b45cf80dedb_name_AL_FTD_temp 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: virtualNetworks_c1cd1f84_007f_4ceb_bdfd_2b45cf80dedb_name_resource
  name: name
  properties: {
    addressPrefix: addressPrefix
    delegations: [
      {
        name: 'Microsoft.ContainerInstance/containerGroups'
        properties: {
          serviceName: 'Microsoft.ContainerInstance/containerGroups'
        }
      }
    ]
    privateEndpointNetworkPolicies: privateEndpointNetworkPolicies
    privateLinkServiceNetworkPolicies: privateLinkServiceNetworkPolicies
  }
}
