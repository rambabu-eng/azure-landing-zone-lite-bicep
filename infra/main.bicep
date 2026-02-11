param location string = 'australiaeast'
param prefix string = 'ramlz'

module networking './modules/networking.bicep' = {
  name: 'networking'
  params: {
    location: location
    prefix: prefix
  }
}
module bastion './modules/bastion.bicep' = {
  name: 'bastion'
  params: {
    location: location
    prefix: prefix
    hubVnetName: '${prefix}-hub-vnet'
  }
}

