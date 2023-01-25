# My experiment with Azure Pipelines and Terraform

## Remote Backend

For the following steps to work, a storage account container must be available in the Azure portal. How to create this via Azure CLI can be found in the file `NewStorage.azcli`.

## Azure Pipelines

In the file `azure-pipelines.yml` an Azure pipeline is created for creating and in the `azure-pipelines-destroy.yml` for removing the infrastructure in Azure Cloud for example. In both pipelines, the remote backend is used for specifying the state of the infrastructure.

To run Azure Pipelines in the Azure DevOps Portal, the desired pipeline must be manually configured in the `Pipelines` section.

## Self hosted agent

> I just discovered that if I run `export AZP_AGENT_USE_LEGACY_HTTP=true` prior to running config.sh, then my SSL validation works as expected. @anatolybolshakov, if you or anyone more familiar with this codebase can help provide info on what may have changed about SSL validation between the legacy HTTP handler and the new default handler, it would be immensely helpful.


```sh
export AZP_AGENT_USE_LEGACY_HTTP=true

./config.sh

./run.sh
```