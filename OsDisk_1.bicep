param disks_MS_EA_EDA_01_OsDisk_1_a608c08f2da346f6a7aa0a3f156d083c_name string = 'MS-EA-EDA-01_OsDisk_1_a608c08f2da346f6a7aa0a3f156d083c'
param location string = 'eastus'
param sku_name string = 'Premium_LRS'
param sku_tier string = 'Premium'

param properties_osType string = 'Linux'
param properties_hyperVGeneration string = 'V2'
param properties_supportedCapabilities_architecture string = 'x64'

param creationData_createOption string = 'FromImage'
param creationData_imageReference string = '/Subscriptions/79e2ddcf-063b-4847-896b-e23141627d4e/Providers/Microsoft.Compute/Locations/eastus/Publishers/debian/ArtifactTypes/VMImage/Offers/debian-11/Skus/11-gen2/Versions/0.20220121.894'
param creationData_diskSizeGB int = 30
param creationData_diskIOPSReadWrite int = 120
param creationData_diskMBpsReadWrite int = 25
param creationData_encryption_type string = 'EncryptionAtRestWithPlatformKey'
param creationData_networkAccessPolicy string = 'AllowAll'
param creationData_publicNetworkAccess string = 'Enabled'
param creationData_diskState string = 'Attached'
param creationData_tier string = 'P4'

resource disks_MS_EA_EDA_01_OsDisk_1_a608c08f2da346f6a7aa0a3f156d083c_name_resource 'Microsoft.Compute/disks@2021-12-01' = {
  name: disks_MS_EA_EDA_01_OsDisk_1_a608c08f2da346f6a7aa0a3f156d083c_name
  location: location
  sku: {
    name: sku_name
    tier: sku_tier
  }
  properties: {
    osType: properties_osType
    hyperVGeneration: properties_hyperVGeneration
    supportedCapabilities: {
      architecture: properties_supportedCapabilities_architecture
    }
    creationData: {
      createOption: creationData_createOption
      imageReference: {
        id: creationData_imageReference
      }
    }
    diskSizeGB: creationData_diskSizeGB
    diskIOPSReadWrite: creationData_diskIOPSReadWrite
    diskMBpsReadWrite: creationData_diskMBpsReadWrite
    encryption: {
      type: creationData_encryption_type
    }
    networkAccessPolicy: creationData_networkAccessPolicy
    publicNetworkAccess: creationData_publicNetworkAccess
    diskState: creationData_diskState
    tier: creationData_tier
  }
}
