variable location {
    type = string
     default = "uksouth"
}

variable resource_group_name {
    type = string   
    default = "demos" 
}

variable aks_cluster_name {
    type = string    
}

variable kubernetes_version {
    type = string    
    default = "1.18.10"
}

variable vm_size {
    type = string    
    default = "Standard_D2s_v4"
}

variable node_count {
    type = number
    default = 1
}

variable node_labels {
    type = map
    default = {
        "purpose" = "system_workloads"
        "workloads" = "ops"
        "provisioner" = "terraform"
    }
}

variable user_workloads_node_labels {
    type = map
    default = {
        "purpose" = "user_workloads"
        "workloads" = "apps"
        "provisioner" = "terraform"
    }
}

variable admin_username {
    type = string
    default = "ca"
}

variable ssh_key {
    type = string  
    default = "~/.ssh/id_rsa.pub"
}

variable vnet_subnet_id {
    type = string
}

variable network_profile {
    type = map
}

variable log_analytics_workspace_id {
    type = string 
}

