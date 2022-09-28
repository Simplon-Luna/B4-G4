# Documentation Terraform

<div id='top'/>  

## Sommaire
### [1 - Qu'est-ce que Terraform ?](#Terraform)
### [2 - Prérequis](#Prérequis)
### [3 - Installation](#Installation)
#### &nbsp;&nbsp;&nbsp; [a) Azure CLI](#Azure-CLI)
#### &nbsp;&nbsp;&nbsp; [b) Terraform](#Terraform-install)
### [4 - Difficultés rencontrées](#Difficultés)
### [5 - Conclusion](#Conclusion)


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

*Windows* :
Via powershell, utiliser Azure CLI pour vous authentifier sur Azure avec la commande suivant :

`Invoke-WebRequest -Uri https://aka.ms/installazurecliwindows -OutFile .\AzureCLI.msi; Start-Process msiexec.exe -Wait -ArgumentList '/I AzureCLI.msi /quiet'; rm .\AzureCLI.msi`

*Mac OS* :
Utiliser [Homebrew](https://brew.sh/), un paquet open source, pour installer [Azure CLI](https://formulae.brew.sh/formula/azure-cli) via le terminal.

`brew update && brew install azure-cli`

[&#8679;](#top)  

<div id='Difficultés'/>  

### Difficultés rencontrées
Nous avons rencontré plusieurs difficultés :
- la documentation Terraform est obsolète sur plusieurs points (pas à jour), ce qui nous a amené un grands nombre de messages d'erreur qu'il a fallu décrypter et corriger.
- les messages d'erreur ne désignent pas la ligne en cause ce qui complique la tâche.
- les codes d'erreur sont peu clairs (cryptiques si l'on peut dire ça).
- les ressources Azure sont difficilement configurables quand elles sont disponibles.
- terraform rencontre des difficultés avec l'interface Cloudshell d'Azure qui n'est pas aussi rapide et corrompt régulièrement les fichiers.

[&#8679;](#top) 

<div id='Conclusion'/> 

### Conclusion

` Terraform est un outil intéressant et pratique pour le déploiement, le maintien, et destruction automatique d'applications et d'infrastsuctures cloud. C'est un outil performant qui souffre d'une documentation dépassée et d'une implémentaiton Azure hazardeuse. `

[&#8679;](#top)  
