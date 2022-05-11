param virtualNetworks_109000_000_SQLBU_vnet_name string = '109000.000_SQLBU-vnet'
param subnets_location string = 'eastus'
param addressPrefixes string = '172.16.0.0/16'
param subnets_name string = 'default'
param subnets_name_delegations_addressPrefixes string = '172.16.0.0/24'
param subnets_name_delegations_name string = 'ACIDelegationService'
param subnets_name_delegations_properties_serviceName string = 'Microsoft.ContainerInstance/containerGroups'
param subnets_privateEndpointNetworkPolicies string = 'Enabled'
param subnets_privateLinkServiceNetworkPolicies string = 'Enabled'
param subnets_enableDdosProtection bool = false

param default_subnets_properties_addressPrefix string = '172.16.0.0/24'
param default_subnets_properties_delegations_name string = 'ACIDelegationService'
param default_subnets_properties_delegations_properties_serviceName string = 'Microsoft.ContainerInstance/containerGroups'
param default_subnets_privateEndpointNetworkPolicies string = 'Enabled'
param default_subnets_privateLinkServiceNetworkPolicies string = 'Enabled'

resource virtualNetworks_109000_000_SQLBU_vnet_name_resource 'Microsoft.Network/virtualNetworks@2020-11-01' = {
  name: virtualNetworks_109000_000_SQLBU_vnet_name
  location: subnets_location
  properties: {
    addressSpace: {
      addressPrefixes: [
        addressPrefixes
      ]
    }
    subnets: [
      {
        name: subnets_name
        properties: {
          addressPrefix: subnets_name_delegations_addressPrefixes
          delegations: [
            {
              name: subnets_name_delegations_name
              properties: {
                serviceName: subnets_name_delegations_properties_serviceName
              }
            }
          ]
          privateEndpointNetworkPolicies: subnets_privateEndpointNetworkPolicies
          privateLinkServiceNetworkPolicies: subnets_privateLinkServiceNetworkPolicies
        }
      }
    ]
    virtualNetworkPeerings: []
    enableDdosProtection: subnets_enableDdosProtection
  }
}

resource virtualNetworks_109000_000_SQLBU_vnet_name_default 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: virtualNetworks_109000_000_SQLBU_vnet_name_resource
  name: subnets_name
  properties: {
    addressPrefix: default_subnets_properties_addressPrefix
    delegations: [
      {
        name: default_subnets_properties_delegations_name
        properties: {
          serviceName: default_subnets_properties_delegations_properties_serviceName
        }
      }
    ]
    privateEndpointNetworkPolicies: default_subnets_privateEndpointNetworkPolicies
    privateLinkServiceNetworkPolicies: default_subnets_privateLinkServiceNetworkPolicies
  }
}
