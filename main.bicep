//module resource_group 'resource_group.bicep' = {
//  scope: "subscription"
//  params:
//    name: 'rg-contoso'
//    location: 'eastus'
//}

module arrastra_pr_aci 'pr_aci.bicep' = {
  name: 'arrastra-pr-aci'
  params: {
    containerGroups_arrastra_pr_aci_workspaceKey: 'SecureString'
    containerGroups_arrastra_pr_aci_name: 'arrastra-pr-aci'
    location: 'eastus'
    sku: 'Standard'
    containers_image: 'ghcr.io/amerilife/arrastra:pr'
    containers_image_ports_protocol: 'TCP'
    containers_image_ports_port: 80
    environmentVariables_memoryInGB: '1.5'
    imageRegistryCredentials_server: 'ghcr.io'
    imageRegistryCredentials_username: 'USERNAME'
    restartPolicy: 'OnFailure'
    osType: 'Linux'
    logAnalytics_workspaceId: '019c89f8-30c4-4b2f-b36b-c45d6b4131da'
  }
}

module arrastra_prod_aci 'prod_aci.bicep' = {
  name: 'arrastra-prod-aci'
  params: {
    location: 'eastus'
    sku: 'Standard'
    image: 'ghcr.io/amerilife/arrastra:latest'
    protocol: 'TCP'
    port: 1433
    environmentVariables_user_name: 'DB_USERNAME'
    environmentVariables_user_value: 'Srv_Amlds'
    environmentVariables_password_name: 'DB_PASSWORD'
    environmentVariables_password_value: 'DwapumC61Lp'
    memoryInGB: '1.5'
    cpu: 1
    server: 'ghcr.io'
    username: 'USERNAME'
    restartPolicy: 'OnFailure'
    ip: '10.16.32.4'
    type: 'Private'
    osType: 'Linux'
  }
}

module virtual_machine 'MS-EA-EDA-01_Virtual_machine.bicep' = {
  name: 'MS-EA-EDA-01'
  params: {
    location: 'eastus'
    vmSize: 'Standard_D16ds_v4'
    storageProfile_osDisk_osType: 'Linux'
    storageProfile_osDisk_createOption: 'FromImage'
    storageProfile_osDisk_caching: 'ReadWrite'
    storageProfile_osDisk_diskSizeGB: 30
    bootDiagnostics_enabled: true
    storageProfile_dataDisks_managedDisk_storageAccountType: 'Premium_LRS'
    storageProfile_dataDisks_managedDisk_deleteOption: 'Detach'
    storageProfile_dataDisks_managedDisk_diskSizeGB: 256
    osProfile_adminUsername: 'edauser'
    
  }
}

module DataDisk_0 'DataDisk_0.bicep' = {
  name: 'MS-EA-EDA-01_DataDisk_0'
  params: {
    location: 'eastus'
    sku_name:'Premium_LRS'
    sku_tier: 'Premium'
    diskSizeGB: 256
    diskIOPSReadWrite: 1100
    diskMBpsReadWrite: 125
    encryption_type: 'EncryptionAtRestWithPlatformKey'
    networkAccessPolicy: 'AllowAll'
    publicNetworkAccess: 'Enabled'
    diskState: 'Attatched'
    tier: 'P15'
  }
}

module OsDisk_1 'OsDisk_1.bicep' = {
  name: 'MS-EA-EDA-01_OsDisk_1'
  params: {
    location: 'eastus'
    sku_name: 'Premium_LRS'
    sku_tier: 'Premium'
    properties_osType: 'Linux'
    properties_hyperVGeneration: 'V2'
    properties_supportedCapabilities_architecture: 'x64'
    creationData_diskSizeGB: 30
    creationData_diskIOPSReadWrite: 120
    creationData_diskMBpsReadWrite: 25
    creationData_networkAccessPolicy: 'AllowAll'
    creationData_publicNetworkAccess: 'Enabled'
    creationData_diskState: 'Attached'
    creationData_tier: 'P4'
  }
}

module  log_analytics_workspace 'log_analytics_workspace.bicep' = {
  name: 'arrastra-pr-log'
  params: {
    location: 'eastus'
    resourcePermissions: true
    retentionInDays: 30
    heartbeatTableRetention: 30
    workspaceName: 'arrastra-pr-log'
    sku: 'pergb2018'

  }
}

module storage_account 'storage_account.bicep' = {
  name: '109000sqlbu'
  params: {
    location: 'eastus'
    tags_Friendly_Name: '109000.000_sqlbu'
    sku_name: 'Standard_RAGRS'
    sku_tier: 'Standard'
    kind: 'StorageV2'
    kind_minimumTlsVersion: 'TLS1_2'
    kind_allowBlobPublicAccess: false
    kind_networkAcls_bypass: 'AzureServices'
    kind_networkAcls_virtualNetworkRules_action: 'Allow'
    kind_networkAcls_virtualNetworkRules_state: 'Succeeded'
    kind_ipRules_defaultAction: 'Deny'
    kind_supportsHttpsTrafficOnly: true
    kind_encryption_file_keyType: 'Account'
    kind_encryption_file_enabled: true
    kind_blob_keyType: 'Account'
    kind_blob_enabled: true
    kind_keySource: 'Microsoft.Storage'
    kind_accessTier: 'Cool'
    deleteRetentionPolicy_allowPermanentDelete: false
    deleteRetentionPolicy_enabled: false
  }
}

module network_interface 'Network_interface.bicep' = {
  name: 'ms-ea-eda-01144'
  params: {
    location: 'eastus'
    ipConfigurations_name: 'ipconfig1'
    ipConfigurations_privateIPAddress: 'IPv4'
    dnsSettings_enableAcceleratedNetworking: true
    dnsSettings_enableIPForwarding: false
  }
}

module networkSecurityGroups 'nsg.bicep' = {
  name: 'MS-EA-EDA-01-nsg'
  params:{
    location: 'eastus'
  }  
}

module virtual_network 'virtual_network.bicep' = {
  name: 'c1cd1f84-007f-4ceb-bdfd-2b45cf80dedb'
  params: {
    location: 'eastus'
    addressPrefixes: '10.0.0.0/16'
    name: 'AL_FTD_temp'
    addressPrefix: '10.0.0.0/24'
    privateEndpointNetworkPolicies: 'Enabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
    enableDdosProtection: false
  }
}
