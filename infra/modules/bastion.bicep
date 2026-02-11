module bastion './modules/bastion.bicep' = {
  name: 'bastion'
  params: {
    location: location
    prefix: prefix
    hubVnetName: '${prefix}-hub-vnet'
  }
}
