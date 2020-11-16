locals {
    aks_kubenet_cluster_name = "kubenetdemo"
    aks_kubenet_subnet_name = "aks_kubenet_demo"  
}

data "azurerm_subnet" "aks_kubenet_subnet" {
    name = local.aks_kubenet_subnet_name
    virtual_network_name = var.vnet
    resource_group_name = data.azurerm_resource_group.contoso_rg.name
}

module aks_kubenet {
    source = "./modules/aks/"
    aks_cluster_name  = local.aks_kubenet_cluster_name  
    vnet_subnet_id    = data.azurerm_subnet.aks_kubenet_subnet.id
    resource_group_name = var.rg_name

    network_profile    =  {
        network_plugin     = "kubenet"
        network_policy     = "calico"    
        service_cidr       = "10.102.0.0/16"
        dns_service_ip     = "10.102.0.10"
        docker_bridge_cidr = "172.17.0.1/16"
        pod_cidr           = "10.244.0.0/16"
    }

    log_analytics_workspace_id = data.azurerm_log_analytics_workspace.law.id
}

