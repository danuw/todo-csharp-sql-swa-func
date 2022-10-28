param name string
param location string = resourceGroup().location
param tags object = {}

param databaseName string = ''
param keyVaultName string

@secure()
param sqlAdminPassword string
@secure()
param appUserPassword string

var defaultDatabaseName = 'Todo'

module sqlServer '../core/database/sqlserver/sqlserver.bicep' = {
  name: 'sqlserver'
  params: {
    name: name
    location: location
    tags: tags
    databaseName: !empty(databaseName) ? databaseName : defaultDatabaseName
    keyVaultName: keyVaultName
    sqlAdminPassword: sqlAdminPassword
    appUserPassword: appUserPassword
  }
}

output connectionStringKey string = sqlServer.outputs.connectionStringKey
output databaseName string = databaseName
