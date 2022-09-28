variable "resource_group_name_prefix" {
  default     = "rg"
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
}

variable "location" {
  default     = "eastus"
  description = "Location of the resource group."
}

variable "prefix" {
  default ="b4g4ld"
  description =" ça n'as pas d'importance"
}

variable "retention_period" {
  default = "1"
  description = "normalement 30 mais comme on peut pas enlever la feature, on a changer la date de rétention pour suppression"
}

variable "ssh_keys" {
  default = "/.ssh/ssh.pub"
}
 
variable "adminmail" {
  default = "simplon.luna@gmail.com"
}
