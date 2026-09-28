# O cluster AKS das Aulas 2 e 3, agora como código.
# Nasce no mesmo aula4-rg da prática, na mesma região (var.location),
# com as mesmas tags da dupla (local.tags).
resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-${var.dupla}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "aks-${var.dupla}"
  sku_tier            = "Free"

  default_node_pool {
    name       = "default"
    node_count = var.node_count
    vm_size    = var.node_vm_size
  }

  identity {
    type = "SystemAssigned"
  }

  tags = local.tags
}

output "aks_cluster_nome" {
  description = "Nome do cluster AKS criado."
  value       = azurerm_kubernetes_cluster.aks.name
}
