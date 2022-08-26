# Commandes utilisées (terraform)

[link](https://docs.microsoft.com/en-us/azure/developer/terraform/get-started-cloud-shell-bash?tabs=bash)

### Vérifier la version
terraform version

### Installation de la dernière version de Terraform
curl -O <terraform_download_url> #téléchargement de la dernière version

### Dézipper le fichier zip
unzip <zip_file_downloaded_in_previous_step> #unzip

### Créer le répertoire bin (s'il n'est pas déjà créé)
mkdir bin

### Déplacer terraform dans le répertoire bin
mv terraform bin/

### Revérifier la version (Redémarrer le terminal bash)
terraform version

### Se connecter à Azure
az login

### Vérification de la connexion
az account show

### Vérification des comptes loggés
az account list --query "[?user.name=='<microsoft_account_email>'].{Name:name, ID:id, Default:isDefault}" --output Table


### Créer un service principal
az ad sp create-for-rbac --name <service_principal_name>

### Mettre à jour (éditer) le fichier ~/.bashrc
*Attention, chaque ligne correspond à une ligne de code, il faut les utiliser séparemment, l'une après l'autre.*

export ARM_SUBSCRIPTION_ID="<azure_subscription_id>"

export ARM_TENANT_ID="<azure_subscription_tenant_id>"

export ARM_CLIENT_ID="<service_principal_appid>"

export ARM_CLIENT_SECRET="<service_principal_password>"

### Exécuter le script bash
. ~/.bashrc

### Vérifier que les changements soient effectifs
printenv | grep ^ARM*

### Crédits (optionnels)
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id   = "<azure_subscription_id>"
  tenant_id         = "<azure_subscription_tenant_id>"
  client_id         = "<service_principal_appid>"
  client_secret     = "<service_principal_password>"
}

###### [code goes there]