param ceruleanWebAppName string
param vermillionWebAppName string
param location string = resourceGroup().location

// App Service Plans
resource ceruleanAppServicePlan 'Microsoft.Web/serverfarms@2021-02-01' = {
  name: ceruleanWebAppName
  location: location
  sku: {
    name: 'F1'
  }
}

resource vermillionAppServicePlan 'Microsoft.Web/serverfarms@2021-02-01' = {
  name: vermillionWebAppName
  location: location
  sku: {
    name: 'F1'
  }
}

// Web Apps
resource ceruleanWebApp 'Microsoft.Web/sites@2021-02-01' = {
  name: ceruleanWebAppName
  location: location
  properties: {
    serverFarmId: ceruleanAppServicePlan.id
  }
}

resource vermillionWebApp 'Microsoft.Web/sites@2021-02-01' = {
  name: vermillionWebAppName
  location: location
  properties: {
    serverFarmId: vermillionAppServicePlan.id
  }
}
