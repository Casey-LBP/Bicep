param storageAccounts_109000sqlbu_name string = '109000sqlbu'
param virtualNetworks_AL_TAMPA_VLAN_externalid string = '/subscriptions/79e2ddcf-063b-4847-896b-e23141627d4e/resourceGroups/AL-TAMPA/providers/Microsoft.Network/virtualNetworks/AL_TAMPA_VLAN'
param location string = 'eastus'
param tags_Friendly_Name string = '109000.000_sqlbu'
param sku_name string = 'Standard_RAGRS'
param sku_tier string = 'Standard'
param kind string = 'StorageV2'
param kind_minimumTlsVersion string = 'TLS1_2'
param kind_allowBlobPublicAccess bool = false
param kind_networkAcls_bypass string = 'AzureServices'
param kind_networkAcls_virtualNetworkRules_action string = 'Allow'
param kind_networkAcls_virtualNetworkRules_state string = 'Succeeded'
param kind_ipRules_defaultAction string = 'Deny'
param kind_supportsHttpsTrafficOnly bool = true
param kind_encryption_file_keyType string = 'Account'
param kind_encryption_file_enabled bool = true
param kind_blob_keyType string = 'Account'
param kind_blob_enabled bool = true
param kind_keySource string = 'Microsoft.Storage'
param kind_accessTier string = 'Cool'
param deleteRetentionPolicy_allowPermanentDelete bool = false
param deleteRetentionPolicy_enabled bool = false

resource storageAccounts_109000sqlbu_name_resource 'Microsoft.Storage/storageAccounts@2021-09-01' = {
  name: storageAccounts_109000sqlbu_name
  location: location
  tags: {
    Friendly_Name: tags_Friendly_Name
  }
  sku: {
    name: sku_name
    tier: sku_tier
  }
  kind: kind
  properties: {
    minimumTlsVersion: kind_minimumTlsVersion
    allowBlobPublicAccess: kind_allowBlobPublicAccess
    networkAcls: {
      bypass: kind_networkAcls_bypass
      virtualNetworkRules: [
        {
          id: '${virtualNetworks_AL_TAMPA_VLAN_externalid}/subnets/AL_TAMPA_SUBNET'
          action: kind_networkAcls_virtualNetworkRules_action
          state: kind_networkAcls_virtualNetworkRules_state
        }
      ]
      ipRules: []
      defaultAction: kind_ipRules_defaultAction
    }
    supportsHttpsTrafficOnly: kind_supportsHttpsTrafficOnly
    encryption: {
      services: {
        file: {
          keyType: kind_encryption_file_keyType
          enabled: kind_encryption_file_enabled
        }
        blob: {
          keyType: kind_blob_keyType
          enabled: kind_blob_enabled
        }
      }
      keySource: kind_keySource
    }
    accessTier: kind_accessTier
  }
}

resource storageAccounts_109000sqlbu_name_default 'Microsoft.Storage/storageAccounts/blobServices@2021-09-01' = {
  parent: storageAccounts_109000sqlbu_name_resource
  name: storageAccounts_109000sqlbu_name
  sku: {
    name: sku_name
    tier: sku_tier
  }
  properties: {
    cors: {
      corsRules: []
    }
    deleteRetentionPolicy: {
      allowPermanentDelete: deleteRetentionPolicy_allowPermanentDelete
      enabled: deleteRetentionPolicy_enabled
    }
  }
}

resource Microsoft_Storage_storageAccounts_fileServices_storageAccounts_109000sqlbu_name_default 'Microsoft.Storage/storageAccounts/fileServices@2021-09-01' = {
  parent: storageAccounts_109000sqlbu_name_resource
  name: storageAccounts_109000sqlbu_name
  sku: {
    name: sku_name
    tier: sku_tier
  }
  properties: {
    protocolSettings: {
      smb: {}
    }
    cors: {
      corsRules: []
    }
  }
}

resource Microsoft_Storage_storageAccounts_queueServices_storageAccounts_109000sqlbu_name_default 'Microsoft.Storage/storageAccounts/queueServices@2021-09-01' = {
  parent: storageAccounts_109000sqlbu_name_resource
  name: storageAccounts_109000sqlbu_name
  properties: {
    cors: {
      corsRules: []
    }
  }
}

resource Microsoft_Storage_storageAccounts_tableServices_storageAccounts_109000sqlbu_name_default 'Microsoft.Storage/storageAccounts/tableServices@2021-09-01' = {
  parent: storageAccounts_109000sqlbu_name_resource
  name: storageAccounts_109000sqlbu_name
  properties: {
    cors: {
      corsRules: []
    }
  }
}
