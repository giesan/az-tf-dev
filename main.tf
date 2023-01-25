locals {
  tags = {
    environnment = "Lab"
    owner        = "Andrej"
  }
}

resource "azurerm_resource_group" "rg" {
  location = var.resource_group_location
  name     = var.resource_group_name
  tags     = local.tags
}

resource "azurerm_kubernetes_cluster" "example" {
  name                = "andys-example-aks"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "exampleaks"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2s"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = local.tags
}

resource "azurerm_container_registry" "myacr" {
  name                = "andysacr"
  sku                 = "Basic"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  tags                = local.tags
}

# resource "azurerm_role_assignment" "enablePulling" {
#   principal_id                     = azurerm_kubernetes_cluster.example.identity[0].principal_id
#   role_definition_name             = "AcrPull"
#   scope                            = azurerm_container_registry.myacr.id
#   skip_service_principal_aad_check = true
# }
