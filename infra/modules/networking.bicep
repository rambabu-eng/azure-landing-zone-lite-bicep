param location string = 'australiaeast'
param prefix string = 'ramlz'

@description('Hub VNet address space')
param hubAddressSpace string = '10.0.0.0/16'

@description('Spoke VNet address space')
param spokeAddressSpace string = '10.1.0.0/16'

resource hubVnet 'Microsoft.Network/virtualNetworks@2023-09-01' = {
  name: '${prefix}-hub-vnet'
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        hubAddressSpace
      ]
    }
    subnets: [
      {
        name: 'AzureBastionSubnet'
        properties: {
          addressPrefix: '10.0.1.0/24'
        }
      }
    ]
  }
}

resource spokeVnet 'Microsoft.Network/virtualNetworks@2023-09-01' = {
  name: '${prefix}-spoke-vnet'
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        spokeAddressSpace
      ]
    }
    subnets: [
      {
        name: 'workload-subnet'
        properties: {
          addressPrefix: '10.1.1.0/24'
        }
      }
    ]
  }
}

resource hubToSpoke 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2023-09-01' = {
  name: 'hub-to-spoke'
  parent: hubVnet
  properties: {
    remoteVirtualNetwork: {
      id: spokeVnet.id
    }
    allowVirtualNetworkAccess: true
  }
}

resource spokeToHub 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2023-09-01' = {
  name: 'spoke-to-hub'
  parent: spokeVnet
  properties: {
    remoteVirtualNetwork: {
      id: hubVnet.id
    }
    allowVirtualNetworkAccess: true
  }
}

output hubVnetName string = hubVnet.name
output spokeVnetName string = spokeVnet.name
