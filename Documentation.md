# Documentation B4-G4

# Documentation Terraform

<div id='top'/>

## Sommaire
### [1 - Qu'est-ce que Terraform ?](#Terraform)
### [2 - Prérequis](Prérequis)
### [3 - Installation](Installation)
#### [a) Azure CLI](Azure-CLI)
#### [b) Terraform](Terraform-install)
### [4 - Authentification](Authentification)

<div id='Terraform'/>  

### Qu'est ce que Terraform ?

Terraform est un outil d'infrastructure en tant que code qui permet à l'utilisateur de créer, de modifier et de versionner l'infrastructure de manière sûre et efficace. Cela inclut à la fois des composants de bas niveau comme les instances de calcul, le stockage et la mise en réseau, ainsi que des composants de haut niveau comme les entrées DNS et les fonctionnalités SaaS.

[&#8679;](#top) 

<div id='Prérequis'/>

### Prérequis

Il est nécessaire d'avoir un compte et un abonnement Microsoft Azure, d'installer la command line interface (CLI) d'Azure et d'utiliser la version 0.14.9 de Terraform au minimum. Ensuite il faut installer l'application Service Principal d'Azure. C'est une application présente dans Azure Active Directory qui contient les jetons d'authentification dont Terraform a besoin pour effectuer des actions au nom de l'utilisateur. 

[&#8679;](#top) 

<div id='Installation'/>

### Installation

<div id='Terraform-install'/>

#### -- Terraform --

Pour installer [Terraform](https://docs.microsoft.com/fr-fr/azure/developer/terraform/quickstart-configure) en fonction de l'OS.

[&#8679;](#top) 

<div id='Azure-CLI'/>

#### -- Azure CLI --

Pour installer [Azure CLI](https://docs.microsoft.com/fr-fr/cli/azure/install-azure-cli) en fonction de l'OS. 

Windows :
Via powershell, utiliser Azure CLI pour vous authentifier sur Azure avec la commande suivant :

`Invoke-WebRequest -Uri https://aka.ms/installazurecliwindows -OutFile .\AzureCLI.msi; Start-Process msiexec.exe -Wait -ArgumentList '/I AzureCLI.msi /quiet'; rm .\AzureCLI.msi`

Mac OS :
Utiliser [Homebrew](https://brew.sh/), un paquet open source, pour installer [Azure CLI](https://formulae.brew.sh/formula/azure-cli) via le terminal.

`brew update && brew install azure-cli`

[&#8679;](#top) 

<div id='Authentification'/>

### Authentification

Terraform à besoin d'être authentifier 
