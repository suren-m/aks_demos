locals {
    aks_cni_calico_cluster_name = "cnidemo-calico"
    aks_cni_calico_subnet_name = "aks_cni_demo_calico"
}

data "azurerm_subnet" "aks_cni_calico_subnet" {
    name = local.aks_cni_calico_subnet_name
    virtual_network_name = var.vnet
    resource_group_name = data.azurerm_resource_group.contoso_rg.name
}

module aks_cni_calico {
    source = "./modules/aks/"
    aks_cluster_name  = local.aks_cni_calico_cluster_name  
    vnet_subnet_id    = data.azurerm_subnet.aks_cni_calico_subnet.id
    resource_group_name = var.rg_name

    network_profile    =  {
        network_plugin     = "azure"
        network_policy     = "calico"    
        service_cidr       = "10.103.0.0/16"
        dns_service_ip     = "10.103.0.10"
        docker_bridge_cidr = "172.17.0.1/16"
        pod_cidr           = null
    }

    log_analytics_workspace_id = data.azurerm_log_analytics_workspace.law.id
}



