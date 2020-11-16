
resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_cluster_name  
  location            = var.location
  resource_group_name = var.resource_group_name  
  kubernetes_version  = var.kubernetes_version
  dns_prefix          = var.aks_cluster_name

  default_node_pool {
    name           = "default"
    node_count     = var.node_count
    vm_size        = var.vm_size
    vnet_subnet_id = var.vnet_subnet_id

    node_labels = var.node_labels
  }

  linux_profile {
    admin_username = var.admin_username 
    ssh_key {
      key_data = file(var.ssh_key) 
    }
  }

  network_profile {
    network_plugin     = var.network_profile.network_plugin
    network_policy     = var.network_profile.network_policy
    service_cidr       = var.network_profile.service_cidr
    dns_service_ip     = var.network_profile.dns_service_ip
    docker_bridge_cidr = var.network_profile.docker_bridge_cidr
    pod_cidr           = var.network_profile.pod_cidr
  }

  role_based_access_control {
    enabled = true
  }

  identity {
    type = "SystemAssigned"
  }

  addon_profile {

    kube_dashboard {
      enabled = true
    }

    azure_policy {
      enabled = true
    }

    oms_agent {
      enabled                    = true
      log_analytics_workspace_id = var.log_analytics_workspace_id
    }
  }  
}
