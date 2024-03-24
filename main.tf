terraform {
  required_providers {
    virtualbox = {
      source = "terra-farm/virtualbox"
      version = "0.2.2-alpha.1"
    }
    
  }
}

resource "virtualbox_vm" "node"{
    count = var.vm_params["vm_count"]
    name = format("node-%02d", count.index + 1)
    image = var.vm_params["vm_image"]
    cpus = var.vm_params["vm_cpus"]
    memory = var.vm_params["vm_memory"]
    #user_data = file("${path.module}/user_data.yml")
    user_data = file("${path.module}/user_data.yml")
    
    network_adapter{
        type = var.vm_network["vm_network_type"]
        host_interface = var.vm_network["vm_network_host_interface"]
    }
}

output "IPAddr" {
  value       =  element(virtualbox_vm.node.*.network_adapter.0.ipv4_address, 1)

}


#output "IPAddr2" {
#  value       = element(virtualbox_vm.node.*.network_adapter.0.ipv4_address, 2)
#}
