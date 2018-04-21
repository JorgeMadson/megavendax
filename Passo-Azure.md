# Sequencia de comandos para subir banco de dados para o azure
No Azure:
1. Abrir o terminal e abrir um servidor armazenamento
(Next, Next)
2. Criar um banco Mysql usando o comando
(Atenção ao --sku-name GP_Gen4_2 --version 5.7)
az mysql server create --name megavendax --resource-group cloud-shell-storage-eastus --location "East US" --admin-user megavendax --admin-password M3g@vendax --sku-name GP_Gen4_2 --version 5.7
3. Copiar o JSON de resposta
{
  "additionalProperties": {},
  "administratorLogin": "megavendax",
  "earliestRestoreDate": "2018-04-21T02:35:42.690000+00:00",
  "fullyQualifiedDomainName": "megavendax.mysql.database.azure.com",
  "id": "/subscriptions/4be83743-b90c-4f90-acec-d71872fb6feb/resourceGroups/cloud-shell-storage-eastus/providers/Microsoft.DBforMySQL/servers/megavendax",
  "location": "eastus",
  "name": "megavendax",
  "resourceGroup": "cloud-shell-storage-eastus",
  "sku": {
    "additionalProperties": {},
    "capacity": 2,
    "family": "Gen4",
    "name": "GP_Gen4_2",
    "size": null,
    "tier": "GeneralPurpose"
  },
  "sslEnforcement": "Enabled",
  "storageProfile": {
    "additionalProperties": {},
    "backupRetentionDays": 7,
    "geoRedundantBackup": "Disabled",
    "storageMb": 5120
  },
  "tags": null,
  "type": "Microsoft.DBforMySQL/servers",
  "userVisibleState": "Ready",
  "version": "5.7"
}
4. Configurando o Firewall
az mysql server firewall-rule create --name allAzureIPs --server megavendax --resource-group cloud-shell-storage-eastus --start-ip-address 0.0.0.0 --end-ip-address 0.0.0.0
* JSON de resposta
{
  "additionalProperties": {},
  "endIpAddress": "0.0.0.0",
  "id": "/subscriptions/4be83743-b90c-4f90-acec-d71872fb6feb/resourceGroups/cloud-shell-storage-eastus/providers/Microsoft.DBforMySQL/servers/megavendax/firewallRules/allAzureIPs",
  "name": "allAzureIPs",
  "resourceGroup": "cloud-shell-storage-eastus",
  "startIpAddress": "0.0.0.0",
  "type": "Microsoft.DBforMySQL/servers/firewallRules"
}
5. Conectando localmente no banco
mysql -u megavendax@megavendax -h megavendax.mysql.database.azure.com -P 3306 -p
6. Corrigir necessidade de conexão SSL. 
Página Inicial -> Segurança de conexão -> Configurações de SSL -> Desabilidade
7. Regras de Firewall
tudo-liberado, 0.0.0.0, 255.255.255.255
8. CREATE DATABASE megavendax;
9. CREATE USER 'megavendax' IDENTIFIED BY 'MegaAdmin'; 
GRANT ALL PRIVILEGES ON megavendax.* TO 'megavendax';

10. Acertando o password
SET PASSWORD FOR 'megavendax'@'localhost' = PASSWORD('M3g@vendax');
11. Não esqueça de por o usuário como usuário@nomeservidor

12. Instalar o yarn

13. rails secret
d845318a251cb210f9e654d396632c06b55723fdad21a85e31d31f467fc1e5f91864aba2c7f425bf3853b681555bf9b2bcecea6c55b602235e44a6cff0be30bb

export RAILS_MASTER_KEY=d845318a251cb210f9e654d396632c06b55723fdad21a85e31d31f467fc1e5f91864aba2c7f425bf3853b681555bf9b2bcecea6c55b602235e44a6cff0be30bb
export SECRET_KEY_BASE=d845318a251cb210f9e654d396632c06b55723fdad21a85e31d31f467fc1e5f91864aba2c7f425bf3853b681555bf9b2bcecea6c55b602235e44a6cff0be30bb

14. Criar um set de user
az webapp deployment user set --user-name jorgemadson --password senha

resposta:
{
  "additionalProperties": {},
  "id": null,
  "kind": null,
  "name": "web",
  "publishingPassword": null,
  "publishingPasswordHash": null,
  "publishingPasswordHashSalt": null,
  "publishingUserName": "jorgemadson",
  "type": "Microsoft.Web/publishingUsers/web",
  "userName": null
}

15. Create a App Service plan

az appservice plan create --name myAppServicePlan --resource-group cloud-shell-storage-eastus --sku S1 --is-linux
resposta:
 {
  "additionalProperties": {},
  "adminSiteName": null,
  "appServicePlanName": "myAppServicePlan",
  "geoRegion": "East US",
  "hostingEnvironmentProfile": null,
  "id": "/subscriptions/4be83743-b90c-4f90-acec-d71872fb6feb/resourceGroups/cloud-shell-storage-eastus/providers/Microsoft.Web/serverfarms/myAppServicePlan",
  "isSpot": false,
  "kind": "linux",
  "location": "East US",
  "maximumNumberOfWorkers": 10,
  "name": "myAppServicePlan",
  "numberOfSites": 0,
  "perSiteScaling": false,
  "provisioningState": "Succeeded",
  "reserved": true,
  "resourceGroup": "cloud-shell-storage-eastus",
  "sku": {
    "additionalProperties": {},
    "capabilities": null,
    "capacity": 1,
    "family": "S",
    "locations": null,
    "name": "S1",
    "size": "S1",
    "skuCapacity": null,
    "tier": "Standard"
  },
  "spotExpirationTime": null,
  "status": "Ready",
  "subscription": "4be83743-b90c-4f90-acec-d71872fb6feb",
  "tags": null,
  "targetWorkerCount": 0,
  "targetWorkerSizeId": 0,
  "type": "Microsoft.Web/serverfarms",
  "workerTierName": null
}

16. Agora o Web app

az webapp create --resource-group cloud-shell-storage-eastus --plan myAppServicePlan --name megavendax --runtime "RUBY|2.3" --deployment-local-git
## Respota:
Local git is configured with url of 'https://jorgemadson@megavendax.scm.azurewebsites.net/megavendax.git'
{
  "additionalProperties": {},
  "availabilityState": "Normal",
  "clientAffinityEnabled": true,
  "clientCertEnabled": false,
  "cloningInfo": null,
  "containerSize": 0,
  "dailyMemoryTimeQuota": 0,
  "defaultHostName": "megavendax.azurewebsites.net",
  "deploymentLocalGitUrl": "https://jorgemadson@megavendax.scm.azurewebsites.net/megavendax.git",
  "enabled": true,
  "enabledHostNames": [
    "megavendax.azurewebsites.net",
    "megavendax.scm.azurewebsites.net"
  ],
  "ftpPublishingUrl": "ftp://waws-prod-blu-089.ftp.azurewebsites.windows.net/site/wwwroot",
  "hostNameSslStates": [
    {
      "additionalProperties": {
        "ipBasedSslResult": null,
        "ipBasedSslState": "NotConfigured",
        "toUpdateIpBasedSsl": null
      },
      "hostType": "Standard",
      "name": "megavendax.azurewebsites.net",
      "sslState": "Disabled",
      "thumbprint": null,
      "toUpdate": null,
      "virtualIp": null
    },
    {
      "additionalProperties": {
        "ipBasedSslResult": null,
        "ipBasedSslState": "NotConfigured",
        "toUpdateIpBasedSsl": null
      },
      "hostType": "Repository",
      "name": "megavendax.scm.azurewebsites.net",
      "sslState": "Disabled",
      "thumbprint": null,
      "toUpdate": null,
      "virtualIp": null
    }
  ],
  "hostNames": [
    "megavendax.azurewebsites.net"
  ],
  "hostNamesDisabled": false,
  "hostingEnvironmentProfile": null,
  "httpsOnly": false,
  "id": "/subscriptions/4be83743-b90c-4f90-acec-d71872fb6feb/resourceGroups/cloud-shell-storage-eastus/providers/Microsoft.Web/sites/megavendax",
  "identity": null,
  "isDefaultContainer": null,
  "kind": "app,linux",
  "lastModifiedTimeUtc": "2018-04-21T04:43:03.636666",
  "location": "East US",
  "maxNumberOfWorkers": null,
  "name": "megavendax",
  "outboundIpAddresses": "40.71.177.34,40.71.1.129,52.170.233.65,40.71.3.54,52.191.115.185",
  "possibleOutboundIpAddresses": "40.71.177.34,40.71.1.129,52.170.233.65,40.71.3.54,52.191.115.185,40.71.177.34",
  "repositorySiteName": "megavendax",
  "reserved": true,
  "resourceGroup": "cloud-shell-storage-eastus",
  "scmSiteAlsoStopped": false,
  "serverFarmId": "/subscriptions/4be83743-b90c-4f90-acec-d71872fb6feb/resourceGroups/cloud-shell-storage-eastus/providers/Microsoft.Web/serverfarms/myAppServicePlan",
  "siteConfig": null,
  "slotSwapStatus": null,
  "snapshotInfo": null,
  "state": "Running",
  "suspendedTill": null,
  "tags": null,
  "targetSwapSlot": null,
  "trafficManagerHostNames": null,
  "type": "Microsoft.Web/sites",
  "usageState": "Normal"
}

17. Configure database settings
az webapp config appsettings set --name megavendax --resource-group cloud-shell-storage-eastus --settings DB_HOST="megavendax.mysql.database.azure.com" DB_DATABASE="megavendax" DB_USERNAME="megavendax@megavendax" DB_PASSWORD="M3g@vendax"
## Resposta: 
" DB_USERNAME="megavendax@megavendax" DB_PASSWORD="M3g@vendax"
[
  {
    "name": "DB_HOST",
    "slotSetting": false,
    "value": "megavendax.mysql.database.azure.com"
  },
  {
    "name": "DB_DATABASE",
    "slotSetting": false,
    "value": "megavendax"
  },
  {
    "name": "DB_USERNAME",
    "slotSetting": false,
    "value": "megavendax@megavendax"
  },
  {
    "name": "DB_PASSWORD",
    "slotSetting": false,
    "value": "M3g@vendax"
  }
]
18. Novo rails secret
e9e96f83b5f791122474af3320a39b79141dc264dfaa4b120f8786f177ac29a744748c67f5d5c00f3bdc3d52ff1746039a773ce783694fad203f0acea89ae8f5

az webapp config appsettings set --name megavendax --resource-group cloud-shell-storage-eastus --settings RAILS_MASTER_KEY="e9e96f83b5f791122474af3320a39b79141dc264dfaa4b120f8786f177ac29a744748c67f5d5c00f3bdc3d52ff1746039a773ce783694fad203f0acea89ae8f5" SECRET_KEY_BASE="e9e96f83b5f791122474af3320a39b79141dc264dfaa4b120f8786f177ac29a744748c67f5d5c00f3bdc3d52ff1746039a773ce783694fad203f0acea89ae8f5" RAILS_SERVE_STATIC_FILES="true" ASSETS_PRECOMPILE="true"
## Resultado: 
[
  {
    "name": "DB_HOST",
    "slotSetting": false,
    "value": "megavendax.mysql.database.azure.com"
  },
  {
    "name": "DB_DATABASE",
    "slotSetting": false,
    "value": "megavendax"
  },
  {
    "name": "DB_USERNAME",
    "slotSetting": false,
    "value": "megavendax@megavendax"
  },
  {
    "name": "DB_PASSWORD",
    "slotSetting": false,
    "value": "M3g@vendax"
  },
  {
    "name": "RAILS_MASTER_KEY",
    "slotSetting": false,
    "value": "e9e96f83b5f791122474af3320a39b79141dc264dfaa4b120f8786f177ac29a744748c67f5d5c00f3bdc3d52ff1746039a773ce783694fad203f0acea89ae8f5"
  },
  {
    "name": "SECRET_KEY_BASE",
    "slotSetting": false,
    "value": "e9e96f83b5f791122474af3320a39b79141dc264dfaa4b120f8786f177ac29a744748c67f5d5c00f3bdc3d52ff1746039a773ce783694fad203f0acea89ae8f5"
  },
  {
    "name": "RAILS_SERVE_STATIC_FILES",
    "slotSetting": false,
    "value": "true"
  },
  {
    "name": "ASSETS_PRECOMPILE",
    "slotSetting": false,
    "value": "true"
  }
]