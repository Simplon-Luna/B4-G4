# Doc load balancer

L’équilibrage de charge correspond à une répartition équilibrée de la charge ou du trafic réseau entrant au sein d’un groupe de ressources ou serveurs back-end.

Azure Load Balancer opère sur la couche 4 du modèle OSI (Open Systems Interconnection). Il s’agit du point de contact unique pour les clients. Load Balancer distribue les flux entrants arrivant sur le serveur frontal de l’équilibreur de charge aux instances de pool back-end. Ces flux dépendent des règles d’équilibrage de charge et des sondes d’intégrité configurées. Les instances de pool de back-ends peuvent être des machines virtuelles Azure ou des instances d’un groupe de machines virtuelles identiques.

Un équilibreur de charge public permet des connexions sortantes pour les machines virtuelles de votre réseau virtuel. Ces connexions s’effectuent par la traduction de leurs adresses IP privées en adresses IP publiques. Les équilibreurs de charge publics sont utilisés pour équilibrer la charge du trafic Internet sur vos machines virtuelles.

Un équilibreur de charge interne (ou privé) est utilisé lorsque des adresses IP privées sont nécessaires uniquement au niveau du serveur front-end. Les équilibreurs de charge internes sont utilisés pour équilibrer la charge du trafic au sein d’un réseau virtuel. Vous pouvez accéder au front-end d’un équilibreur de charge à partir d’un réseau local dans le cadre d’un scénario hybride.