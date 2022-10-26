param name string
param location string = resourceGroup().location
param tags object = {}

param databaseName string = 'ToDo'
param keyVaultName string

@secure()
param sqlAdminPassword string
@secure()
param appUserPassword string

module sqlServer '../core/database/sqlserver/sqlserver.bicep' = {
  name: 'sqlserver'
  params: {
    name: name
    location: location
    tags: tags
    dbName: databaseName
    keyVaultName: keyVaultName
    sqlAdminPassword: sqlAdminPassword
    appUserPassword: appUserPassword
  }
}

output connectionStringKey string = sqlServer.outputs.connectionStringKey
output databaseName string = databaseName
