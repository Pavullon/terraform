variable vm_provider_param{
  type = object({
    vm_provider_source = string
    vm_provider_source_version = string
  })

  default = {
    vm_provider_source = "terra-farm/virtualbox"
    vm_provider_source_version = "0.2.2-alpha.1"
  }
}

variable vm_params {
  type        = object({
    vm_count = number
    vm_image = string
    vm_cpus = number
    vm_memory = string
  })
  default     = {
    vm_count = 1
    vm_image = "https://app.vagrantup.com/ubuntu/boxes/bionic64/versions/20230607.0.0/providers/virtualbox.box"
    #vm_image = "virtualbox.box"
    #vm_image = "https://cloud-images.ubuntu.com/releases/22.04/release-20240319/ubuntu-22.04-server-cloudimg-amd64-vagrant.box"
    vm_cpus = 2
    vm_memory = "1024 mib"
  }
}

variable vm_network{
  type = object({
    vm_network_type = string
    vm_network_host_interface = string
  })

  default = {
    vm_network_type = "hostonly"
    vm_network_host_interface = "vboxnet0"
  }
}
