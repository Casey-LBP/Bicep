param disks_MS_EA_EDA_01_DataDisk_0_name string = 'MS-EA-EDA-01_DataDisk_0'
param location string = 'eastus'
param sku_name string = 'Premium_LRS'
param sku_tier string = 'Premium'
param properties_creationData_createOption string = 'Empty'
param diskSizeGB int = 256
param diskIOPSReadWrite int = 1100
param diskMBpsReadWrite int = 125
param encryption_type string = 'EncryptionAtRestWithPlatformKey'
param networkAccessPolicy string = 'AllowAll'
param publicNetworkAccess string = 'Enabled'
param diskState string = 'Attached'
param tier string = 'P15'

resource disks_MS_EA_EDA_01_DataDisk_0_name_resource 'Microsoft.Compute/disks@2021-12-01' = {
  name: disks_MS_EA_EDA_01_DataDisk_0_name
  location: location
  sku: {
    name: sku_name
    tier: sku_tier
  }
  properties: {
    creationData: {
      createOption: properties_creationData_createOption
    }
    diskSizeGB: diskSizeGB
    diskIOPSReadWrite: diskIOPSReadWrite
    diskMBpsReadWrite: diskMBpsReadWrite
    encryption: {
      type: encryption_type
    }
    networkAccessPolicy: networkAccessPolicy
    publicNetworkAccess: publicNetworkAccess
    diskState: diskState
    tier: tier
  }
}
