param containerGroups_arrastra_prod_aci_name string = 'arrastra-prod-aci'
param virtualNetworks_AL_TAMPA_VLAN_externalid string = '/subscriptions/79e2ddcf-063b-4847-896b-e23141627d4e/resourceGroups/AL-TAMPA/providers/Microsoft.Network/virtualNetworks/AL_TAMPA_VLAN'
param location string = 'eastus'
param sku string = 'Standard'
param image string = 'ghcr.io/amerilife/arrastra:latest'
param protocol string = 'TCP'
param port int = 1433
param environmentVariables_user_name string = 'DB_USERNAME'
param environmentVariables_user_value string = 'Srv_Amlds'
param environmentVariables_password_name string = 'DB_PASSWORD'
param environmentVariables_password_value string = 'DwapumC61Lp'
param memoryInGB string = '1.5'
param cpu int = 1
param server string = 'ghcr.io'
param username string = 'USERNAME'
param restartPolicy string = 'OnFailure'
param ip string = '10.16.32.4'
param type string = 'Private'
param osType string = 'Linux'
param subnetIds_id string = '${virtualNetworks_AL_TAMPA_VLAN_externalid}/subnets/AL_FTD_temp'


resource containerGroups_arrastra_prod_aci_name_resource 'Microsoft.ContainerInstance/containerGroups@2021-10-01' = {
  name: containerGroups_arrastra_prod_aci_name
  location: location
  properties: {
    sku: sku
    containers: [
      {
        name: containerGroups_arrastra_prod_aci_name
        properties: {
          image: image
          ports: [
            {
              protocol: protocol
              port: port
            }
          ]
          environmentVariables: [
            {
              name: environmentVariables_user_name
              value: environmentVariables_user_value
            }
            {
              name: environmentVariables_password_name
              value: environmentVariables_password_value
            }
          ]
          resources: {
            requests: {
              memoryInGB: memoryInGB
              cpu: cpu
            }
          }
        }
      }
    ]
    initContainers: []
    imageRegistryCredentials: [
      {
        server: server
        username: username
      }
    ]
    restartPolicy: restartPolicy
    ipAddress: {
      ports: [
        {
          protocol: protocol
          port: port
        }
      ]
      ip: ip
      type: type
    }
    osType: osType
    subnetIds: [
      {
        id: subnetIds_id
      }
    ]
  }
}
