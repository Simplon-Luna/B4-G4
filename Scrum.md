# Scrum

## informations du Brief 4
[ici](https://github.com/Simplon-Luna/B4-G4/blob/main/Brief%204.pdf)

ou

[là](https://doc.n11e.fr/s/cH1INAodj)


### 22-08-25
Hier, prise en compte du brief individuellement et en groupe, topologie (Luna & Dunvael) avec développement des couleurs et de l’organisation Mermaid sur Markdown.

 
Etablissement à 3 du plan d’action, planification des politiques de scaling, de backup, de monitoring. Coordination avec groupe partenaire pour switch projet. Initiation du Project Board (Kanban).

Baptiste s’est occupé de la planification des tests de charge, recherche documentation et préparation des ressources Azure pour le Brief en cours.

### 22-08-26
Finalisation du plan d'action et présentation.

Difficultée et faire aujourd'hui :

Baptiste : installation de terraform

Dunvael : Lire doc Terraform & install. Hier, un peu perdue avec les nouvelles notions de scaling et beaucoup d'info a gérer.

Luna : Terraform install -> Pterodactyl. Difficulté de transmission d'information a réfler.

### 22-08-30
Hier on a beaucoup travaillés sur le code en lui-même pour comprendre mieux les conceptes.

Baptiste a travaillé sur la BDD et la mise en place de la VM via Terraform.

Aujourd'hui, on va se concentrer sur la configuration des VM et des groupes de sécurité avant de s'attarder à la mise en place de Pterodactyl.

### 22-08-31
Hier on a trouver un script bien détailler pour l'installation de Pterodactyl au complet, avec Wings & Docker.

Continuer avec l'automatisation du script pour Dunvael & Luna, recherche Load Balancer, gateway & start cloud init pour  Baptiste.

### 22-09-01
Baptiste. Finis MariaDB, paramettrage des resources manquantes (subnet, etc) et attente de ce fucking Azure qui dort. Aujourd'hui finission du load balance.

Dunvael et Maitresse Scrum. Hier plus du projet de Pterodactyl (la loose), refocus sur un install manu-auto de Pterodactyl. Aujourd'hui refocus sur le brief, terraform & VM mock.

### 22-09-02
Hier, réunion communication du groupe, mise en place de règle 1 travail de groupe minimum par jour. Travaillée avec Dunvael sur Terraform pour mise en place infra.

Dunvael, reprise Terraform sous l'oeil, communication d'équipe c'était important et il faut continuer pour évoluer et déveloper les compétences. Mission du jour, régler le problème com et arriver à faire scale-in&out.

Baptiste, hier aider et fait une partie de scale set & load balancer. Aujourd'hui, finis le outbound rules & Pterodactyl. Et manger les 4 derniers Speculos.

### 22-09-05
Scrum des scrums

D&L - Travail sur loadbalancer et nouveau script de déployement plus généralisé.

Baptiste - re-création complete de l'infrastructure pour le load balancer & gateway.

### 22-09-06
D&L - Monitoring

Baptiste - Bastion et backup

### 22-09-07
Hier, Baptiste - Bastion & Backup (finis)
Hier, Dunvael & Luna - Prepa Monitoring et mise en place.

Aujourd'hui

Baptiste - Proposition de changement de Pterodactyl à Gitea. Proposition acceptée par le reste de l'équipe. Recherche pour adaptation du code pour Gitea en groupe post-monitoring.

Dunvael & Luna - Finition du monitoring.

### 22-09-08
Luna et Dunvael : création du monitoring et configuration, ajout du code de Baptiste.
Baptiste : création de Bastion, de son vnet et configuration de Bastion.
Objectifs : enlever la deuxième VM (Panel ou wings) qui ne sert à rien, enlever redis, installer Gitea, documentation, le gateway à la place du load balancer. 

### 22-09-12
Objectifs du 08 accomplis sauf App Gateway qu'on garde et la doc.

Il faut faire la doc du groupe et la doc de transmission et faire le test de montée en charge.

Optionnel, faire le FQDN.

### 22-09-13
Objectif d'hier atteint, script initial terminé !

DocS a réaliser

### 22-09-14
Baptiste a fait de la doc, nous avons finis le code et la mise en place du load tester Azure.

### 22-09-15
Hier nous avons repris le code d'Alfred pour le load test et le scaling.

Aujourd'hui, nous finirons la mise en place du scaling et nous passerons au code Ansible.

### 22-09-16
Hier nous avons terminé Ansible. Aujourd'hui "cours" sur l'exam AZ900.

### 22-09-19
Exam Time !!! (and #### that ##### from India)

### 22-09-20
Le resto était pas mal mais Emiko est meilleur.

Brief 4 déjà terminé depuis 1 semaine... Paufinage... ZzZz

### 22-09-21
Reprise du code d'Alfred en ***TERRAFORM*** pour ajouter la désactivation de Soft Delete Feature State et du scale-up&down rajouté parcequ'on est trop forts... Et trop en avance. Donc pas de sieste -_-"

### 22-09-22
Hier, travail sur le rajout de scale-up/down mais pas de doc...
Aujourd'hui, changement d'objectif par Alfred. Scaling avec graph de donnée quelle VM réponds à quelle requêtes par seconde...

### 22-09-23
Hier, travail plutôt acharné avec Alfred et Bryan pour un script en Python de montée en charge sur des VM qui répondent super mal et Azure qui déconne... La montée en charge fonctionne, le scaling... plus, parce que Azure...

Aujourd'hui, 
    - Réunion d'information style de travail de groupe et protocoles G4.
    - Reprise de l'exercice en cours.

Message de Noa important : Manger des fruits et légumes c'est important !

### 22-09-26
Hier, weekend trop court, toute l'équipe est d'accord... On veut dormir.

Les filles ont toutes des courbatures... Ne posez pas la question.
Apparemment, Noa a aussi des courbes... Atures.

Vendredi, code de graph en cours de débug et dev.

Aujourd'hui, vérification des codes et scripts précédants, vérification des docs prévues pour demain. Continuation du dev du code de graph monitoring. MAJ du script original Terraform pour inclure la commande Azure CLI d'annulation du soft lock du backup et décommentage de la back-up policy.

David nous a ***ENCORE*** fait rentrer des moustiques dans la salle après nous avoir maintenu "qu'il n'y a plus de moustiqueS" et qu'on était parano.

### 22-09-27
Hier, Réussis à terminé à implémenté le back up vault unlock correctement. Codes tous fonctionnels hormis le code de la courbe cumulutrice pour le graph.

### 22-09-26
Hier, cours et application du cours Docker. Aujourd'hui, mise à jours de docs et préparation pour la présentation, stabilisation et implémentation du code de la courbe cumulatrice, potentiellement ajout du code de VMSS pour le brief original.

