param location string
param prefix string
param hubVnetName string

resource pip 'Microsoft.Network/publicIPAddresses@2023-09-01' = {
  name: '${prefix}-bastion-pip'
  location: location
  sku: { name: 'Standard' }
  properties: {
    publicIPAllocationMethod: 'Static'
  }
}

resource bastion 'Microsoft.Network/bastionHosts@2023-09-01' = {
  name: '${prefix}-bastion'
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'config'
        properties: {
          publicIPAddress: { id: pip.id }
          subnet: {
            id: resourceId('Microsoft.Network/virtualNetworks/subnets', hubVnetName, 'AzureBastionSubnet')
          }
        }
      }
    ]
  }
}
