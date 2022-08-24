# Plan d'action

1. Kanban
2. Lecture des documentations Terraform et Pterodactyl
3. Topologie de l'infrastructure
4. Liste ressources Azure
5. Liste tâches à faire sur le [Board](https://github.com/users/Simplon-Luna/projects/1/views/1)
6. Documentation Terraform et Ansible
7. Table d'adressage
8. Ch 1: déploiement d’une infrastructure minimale
9. Installation de Terraform
10. Ch 2: déploiement  BDD (Mariadb)
11. Ch 3: déploiement d’un espace de stockage (MFS?)
12. Installation de Pterodactyl (sous ubuntu)
13. Installation de Apache
14. Installation de Wings
15. Ch 4: script cloud-init
16. Ch 5: déploiement d’une application gateway
17. Ch 6: mise en place de TLS
18. Ch 7: Monitoring de l’application
19. Ch 8: script de test de montée en charge
20. Ch 9: backup
21. Ch 10: scale set /!\ ***SWITCH APP*** /!\
22. Ch 11: auto scale
23. Les tests et métriques de monitoring
24. Le plan de test de charge
25. Backup (politique)
26. Stratégie de scaling (Ansible)
27. N/A

-------------------------------------------

Azure ressource

| ressource | Terraform | Pterodactyl | Bastion  |
| -------- | -------- | -------- | -------- |
| Azure service    | ✓     | ✗    | ✗    |
| ressource groupe    | ✓     | ✓     |✓     |
| VM    | ✓     | ✓     |✓    |
| Vnet    | ✓    | ✓     | ✓     |
| subnet     | ✓     | ✓     |✓     |
| mariadb     | ✗     | ✗    |✓     |

Ressource vm:

- Disque : hdd
- RAM: 8 giga (16 pour une - utilisation réelle)
- Coeur: 1

Ressource MariaDB:

- Disque: SSD
- RAM: 4Gb
- Coeur: 1
