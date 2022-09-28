variable "rg" {
  default = "rg"
}

variable "location" {
  default = "eastus"
}

variable "prefix" {
  default ="b4g4ld"
  description =" ça n'as pas d'importance"
}

variable "ssh_keys" {
  default = "/ssh/ssh.pub"
}

variable "adminmail" {
  default = ["simplon.luna@gmail.com","simplon.lerouxdunvael@gmail.com","asawaya.ext@simplon.co","bstewart.ext@simplon.co"]
}

variable "subdomain-prefix" {
  default = "votingapp-b4g4ld"
}

data "cloudinit_config" "cloud-init" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content      = templatefile("cloud-init.yml", {REDIS_HOST = azurerm_redis_cache.redis.hostname,
                                                      REDIS_PWD = azurerm_redis_cache.redis.primary_access_key})
  }
}
