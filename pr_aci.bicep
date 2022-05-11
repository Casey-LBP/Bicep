@secure()
param containerGroups_arrastra_pr_aci_workspaceKey string
param containerGroups_arrastra_pr_aci_name string = 'arrastra-pr-aci'
param virtualNetworks_AL_TAMPA_VLAN_externalid string = '/subscriptions/79e2ddcf-063b-4847-896b-e23141627d4e/resourceGroups/AL-TAMPA/providers/Microsoft.Network/virtualNetworks/AL_TAMPA_VLAN'
param location string = 'eastus'
param sku string = 'Standard'

param containers_image string = 'ghcr.io/amerilife/arrastra:pr'
param containers_image_ports_protocol string = 'TCP'
param containers_image_ports_port int = 80

param environmentVariables_memoryInGB string = '1.5'
param environmentVariables_cpu int = 1

param imageRegistryCredentials_server string = 'ghcr.io'
param imageRegistryCredentials_username string = 'USERNAME'

param restartPolicy string = 'OnFailure'
param osType string = 'Linux'
param logAnalytics_workspaceId string = '019c89f8-30c4-4b2f-b36b-c45d6b4131da'
param subnetIds_id string = '${virtualNetworks_AL_TAMPA_VLAN_externalid}/subnets/AL_FTD_temp'

resource containerGroups_arrastra_pr_aci_name_resource 'Microsoft.ContainerInstance/containerGroups@2021-10-01' = {
  name: containerGroups_arrastra_pr_aci_name
  location: location
  properties: {
    sku: sku
    containers: [
      {
        name: containerGroups_arrastra_pr_aci_name
        properties: {
          image: containers_image
          ports: [
            {
              protocol: containers_image_ports_protocol
              port: containers_image_ports_port
            }
          ]
          environmentVariables: []
          resources: {
            requests: {
              memoryInGB: environmentVariables_memoryInGB
              cpu: environmentVariables_cpu
            }
          }
        }
      }
    ]
    initContainers: []
    imageRegistryCredentials: [
      {
        server: imageRegistryCredentials_server
        username: imageRegistryCredentials_username
      }
    ]
    restartPolicy: restartPolicy
    osType: osType
    diagnostics: {
      logAnalytics: {
        workspaceId: logAnalytics_workspaceId
        workspaceKey: containerGroups_arrastra_pr_aci_workspaceKey
      }
    }
    subnetIds: [
      {
        id: subnetIds_id
      }
    ]
  }
}
