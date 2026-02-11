param location string = 'australiaeast'
param prefix string = 'ramlz'

module networking './modules/networking.bicep' = {
  name: 'networking'
  params: {
    location: location
    prefix: prefix
  }
}
