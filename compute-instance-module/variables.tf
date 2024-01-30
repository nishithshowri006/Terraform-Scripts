variable "service_account" {
    type = string
    description = "Service Account with required api accesses for VM usage"
}

variable "instance_name" {
    type = string
    description = "Name of the compute instance"
}

variable "machine_type" {
    type = object({
      configuration = string
      minimum_cpu_platform = string 
    })
    description = "Machine configuration"
    default = {
      configuration = "n2d-standard-4"
      minimum_cpu_platform = "AMD Milan"
    }

}

variable "zone" {
  type = string
  description = "Mention the zone to be created"
  default = "us-central1-a"
}

variable "image" {
  type = string
  description = "Image version to be used"
  default = "ubuntu-os-cloud/ubuntu-2204-lts"
}

variable "shared_vpc" {
    type = object({
      name = string
      project_id = string 
    })
    description = "shared vpc name"
}

