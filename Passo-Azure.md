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
