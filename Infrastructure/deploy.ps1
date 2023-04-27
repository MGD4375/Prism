az bicep build --file .\Infrastructure\deployment.bicep
az bicep build --file .\Infrastructure\frontdoor-deployment.bicep

# az login
az group create --name prism --location UkSouth
az deployment group create --resource-group prism --template-file .\Infrastructure\deployment.json --parameters ceruleanWebAppName=prism-cerulean-web vermillionWebAppName=prism-vermillion-web

# Deploy Front Door
az deployment group create --resource-group prism --template-file .\Infrastructure\frontdoor-deployment.json `
  --parameters frontDoorName=prism-web ceruleanBackendAddress=prism-cerulean-web.azurewebsites.net vermillionBackendAddress=prism-vermillion-web.azurewebsites.net

# For prism-cerulean-web
dotnet publish .\Prism.Cerulean.Web\Prism.Cerulean.Web.csproj -c Release -o ./publish/cerulean/
Compress-Archive -Path ./publish/cerulean/* -DestinationPath ./publish/prism-cerulean-web.zip -Force
az webapp deployment source config-zip --resource-group prism --name prism-cerulean-web --src ./publish/prism-cerulean-web.zip

# For prism-vermillion-web
dotnet publish .\Prism.Vermillion.Web\Prism.Vermillion.Web.csproj -c Release -o ./publish/vermillion/
Compress-Archive -Path ./publish/vermillion/* -DestinationPath ./publish/prism-vermillion-web.zip -Force
az webapp deployment source config-zip --resource-group prism --name prism-vermillion-web --src ./publish/prism-vermillion-web.zip
