param networkInterfaces_ms_ea_eda_01144_name string = 'ms-ea-eda-01144'
param virtualNetworks_AL_TAMPA_VLAN_externalid string = '/subscriptions/79e2ddcf-063b-4847-896b-e23141627d4e/resourceGroups/AL-TAMPA/providers/Microsoft.Network/virtualNetworks/AL_TAMPA_VLAN'
param networkSecurityGroups_MS_EA_EDA_01_nsg_externalid string = '/subscriptions/79e2ddcf-063b-4847-896b-e23141627d4e/resourceGroups/109000.000_SQLBU/providers/Microsoft.Network/networkSecurityGroups/MS-EA-EDA-01-nsg'

param location string = 'eastus'
param ipConfigurations_name string = 'ipconfig1'
param ipConfigurations_privateIPAddress string = '10.16.207.151'
param ipConfigurations_privateIPAllocationMethod string = 'Dynamic'
param ipConfigurations_subnet_id string = '${virtualNetworks_AL_TAMPA_VLAN_externalid}/subnets/AL_TAMPA_SUBNET'
param ipConfigurations_primary bool = true
param ipConfigurations_privateIPAddressVersion string = 'IPv4'

param dnsSettings_enableAcceleratedNetworking bool = true
param dnsSettings_enableIPForwarding bool = false


resource networkInterfaces_ms_ea_eda_01144_name_resource 'Microsoft.Network/networkInterfaces@2020-11-01' = {
  name: networkInterfaces_ms_ea_eda_01144_name
  location: location
  properties: {
    ipConfigurations: [
      {
        name: ipConfigurations_name
        properties: {
          privateIPAddress: ipConfigurations_privateIPAddress
          privateIPAllocationMethod: ipConfigurations_privateIPAllocationMethod
          subnet: {
            id: ipConfigurations_subnet_id
          }
          primary: ipConfigurations_primary
          privateIPAddressVersion: ipConfigurations_privateIPAddressVersion
        }
      }
    ]
    dnsSettings: {
      dnsServers: []
    }
    enableAcceleratedNetworking: dnsSettings_enableAcceleratedNetworking
    enableIPForwarding: dnsSettings_enableIPForwarding
    networkSecurityGroup: {
      id: networkSecurityGroups_MS_EA_EDA_01_nsg_externalid
    }
  }
}
