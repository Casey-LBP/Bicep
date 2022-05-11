param virtualMachines_MS_EA_EDA_01_name string = 'MS-EA-EDA-01'
param disks_MS_EA_EDA_01_OsDisk_1_a608c08f2da346f6a7aa0a3f156d083c_externalid string = '/subscriptions/79e2ddcf-063b-4847-896b-e23141627d4e/resourceGroups/109000.000_SQLBU/providers/Microsoft.Compute/disks/MS-EA-EDA-01_OsDisk_1_a608c08f2da346f6a7aa0a3f156d083c'
param disks_MS_EA_EDA_01_DataDisk_0_externalid string = '/subscriptions/79e2ddcf-063b-4847-896b-e23141627d4e/resourceGroups/109000.000_SQLBU/providers/Microsoft.Compute/disks/MS-EA-EDA-01_DataDisk_0'
param networkInterfaces_ms_ea_eda_01144_externalid string = '/subscriptions/79e2ddcf-063b-4847-896b-e23141627d4e/resourceGroups/109000.000_SQLBU/providers/Microsoft.Network/networkInterfaces/ms-ea-eda-01144'

param location string = 'eastus'
param vmSize string = 'Standard_D16ds_v4'

param storageProfile_imageReference_publisher string = 'debian'
param storageProfile_imageReference_offer string = 'debian-11'
param storageProfile_imageReference_sku string = '11-gen2'
param storageProfile_imageReference_version string = 'latest'

param storageProfile_osDisk_osType string = 'Linux'
param storageProfile_osDisk_name string = '${virtualMachines_MS_EA_EDA_01_name}_OsDisk_1_a608c08f2da346f6a7aa0a3f156d083c'
param storageProfile_osDisk_createOption string = 'FromImage'
param storageProfile_osDisk_caching string = 'ReadWrite'
param storageProfile_osDisk_managedDisk_storageAccountType string = 'Premium_LRS'
param storageProfile_osDisk_deleteOption string = 'Delete'
param storageProfile_osDisk_diskSizeGB int = 30

param storageProfile_dataDisks_lun int = 0
param storageProfile_dataDisks_name string = '${virtualMachines_MS_EA_EDA_01_name}_DataDisk_0'
param storageProfile_dataDisks_createOption string = 'Attach'
param storageProfile_dataDisks_caching string = 'None'
param storageProfile_dataDisks_writeAcceleratorEnabled bool = false
param storageProfile_dataDisks_managedDisk_storageAccountType string = 'Premium_LRS'
param storageProfile_dataDisks_managedDisk_deleteOption string = 'Detach'
param storageProfile_dataDisks_managedDisk_diskSizeGB int = 256
param storageProfile_dataDisks_managedDisk_toBeDetached bool = false

param osProfile_adminUsername string = 'edauser'
param osProfile_linuxConfiguration_disablePasswordAuthentication bool = false
param osProfile_linuxConfiguration_provisionVMAgent bool = true
param osProfile_linuxConfiguration_patchSettings_patchMode string = 'ImageDefault'
param osProfile_linuxConfiguration_patchSettings_assessmentMode string = 'ImageDefault'

param networkProfile_secrets_allowExtensionOperations bool = true
param networkProfile_secrets_requireGuestProvisionSignal bool = true

param networkInterfaces_deleteOption string = 'Detach'

param bootDiagnostics_enabled bool = true

resource virtualMachines_MS_EA_EDA_01_name_resource 'Microsoft.Compute/virtualMachines@2021-11-01' = {
  name: virtualMachines_MS_EA_EDA_01_name
  location: location
  properties: {
    hardwareProfile: {
      vmSize: vmSize
    }
    storageProfile: {
      imageReference: {
        publisher: storageProfile_imageReference_publisher
        offer: storageProfile_imageReference_offer
        sku: storageProfile_imageReference_sku
        version: storageProfile_imageReference_version
      }
      osDisk: {
        osType: storageProfile_osDisk_osType
        name: storageProfile_osDisk_name
        createOption: storageProfile_osDisk_createOption
        caching: storageProfile_osDisk_caching
        managedDisk: {
          storageAccountType: storageProfile_osDisk_managedDisk_storageAccountType
          id: disks_MS_EA_EDA_01_OsDisk_1_a608c08f2da346f6a7aa0a3f156d083c_externalid
        }
        deleteOption: storageProfile_osDisk_deleteOption
        diskSizeGB: storageProfile_osDisk_diskSizeGB
      }
      dataDisks: [
        {
          lun: storageProfile_dataDisks_lun
          name: storageProfile_dataDisks_name
          createOption: storageProfile_dataDisks_createOption
          caching: storageProfile_dataDisks_caching
          writeAcceleratorEnabled: storageProfile_dataDisks_writeAcceleratorEnabled
          managedDisk: {
            storageAccountType: storageProfile_dataDisks_managedDisk_storageAccountType
            id: disks_MS_EA_EDA_01_DataDisk_0_externalid
          }
          deleteOption: storageProfile_dataDisks_managedDisk_deleteOption
          diskSizeGB: storageProfile_dataDisks_managedDisk_diskSizeGB
          toBeDetached: storageProfile_dataDisks_managedDisk_toBeDetached
        }
      ]
    }
    osProfile: {
      computerName: virtualMachines_MS_EA_EDA_01_name
      adminUsername: osProfile_adminUsername
      linuxConfiguration: {
        disablePasswordAuthentication: osProfile_linuxConfiguration_disablePasswordAuthentication
        provisionVMAgent: osProfile_linuxConfiguration_provisionVMAgent
        patchSettings: {
          patchMode: osProfile_linuxConfiguration_patchSettings_patchMode
          assessmentMode: osProfile_linuxConfiguration_patchSettings_assessmentMode
        }
      }
      secrets: []
      allowExtensionOperations: networkProfile_secrets_allowExtensionOperations
      requireGuestProvisionSignal: networkProfile_secrets_requireGuestProvisionSignal
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: networkInterfaces_ms_ea_eda_01144_externalid
          properties: {
            deleteOption: networkInterfaces_deleteOption
          }
        }
      ]
    }
    diagnosticsProfile: {
      bootDiagnostics: {
        enabled: bootDiagnostics_enabled
      }
    }
  }
}
