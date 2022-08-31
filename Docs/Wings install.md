# [Wings](https://pterodactyl.io/wings/1.0/installing.html) install
[Git d'installation](https://github.com/vilhelmprytz/pterodactyl-installer/blob/master/install-wings.sh)

## Prérequis

### Il faut installer docker

`curl -sSL https://get.docker.com/ | CHANNEL=stable bash`

### Lancer Docker au démarrage

Si sur système (Ubuntu 16+, Debian 8+, CentOS 7+) lancer la commande ci-dessous pour lancer Docker au boot de la machine.

`systemctl enable --now docker`

### Activer le swap (optionnel mais permet d'éviter des erreurs mémoire)
Lancer `docker info` et rechercher l'output `WARNING: No swap limit support`.

Activer le swap : ouvrir en tant qu'utilisateur `root/etc/default/grub` et trouver la ligne qui commence avec `GRUB_CMDLINE_LINUX_DEFAULT`. La ligne doit inclure `swapaccount=1`.

Puis lancer la commande `sudo update-grub` suivie par `sudo reboot` pour redémarrer le serveur et que swap soit activé.

*Certaines distributions linux ne prennent pas en compte `GRUB_CMDLINE_LINUX_DEFAULT`. Il faut alors utiliser `GRUB_CMDLINE_LINUX`.*

### Installer Wings
Créer le répetoire de base : 
`mkdir -p /etc/pterodactyl`

Télécharger les exécutables : 
`curl -L -o /usr/local/bin/wings "https://github.com/pterodactyl/wings/releases/latest/download/wings_linux_$([[ "$(uname -m)" == "x86_64" ]] && echo "amd64" || echo "arm64")"`

`chmod u+x /usr/local/bin/wings`

### Configurer Wings

Aller sur la vue administrative du Panel, sélectionner Nodes sur la barre de menus et cliquer sur "Créer un nouveau bouton"

Une fois créé, cliquer sur le node et aller dans l'onglet "Configuration". Copier le code et le coller dans un nouveau fichier nommé `config.yml` dans `/etc/pterodactyl`. Sauvegarder.

Sinon, cliquer sur "Générer un bouton Token", copier la commande Bash et la coller dans le terminal.