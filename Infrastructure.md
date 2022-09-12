```mermaid
flowchart TD 

user(Utilisateurs)
admin(Administrateurs)

    subgraph Web [Internet]
    vide( )
    void( )
    end  

    subgraph AZ [azure]
        subgraph BDD [Stockage]
        apa(Apache)
        bdd(MariaDB)
        end


    proxy(Bastion)
    appGW(Load Balancer)

        subgraph VM [Scaling - Gitea]
        vm1(VM)
        vm2(VM)
        vm3(VM)
        vm4(VM)
        vm5(VM)
        vm6(VM)
        vm7(VM)
        vm8(VM)
        end

    end 

user --- vide --> proxy --> appGW --> VM
admin --- |ssh| void --> |ssh| proxy --> |ssh| BDD
VM <--> BDD

    classDef rouge fill:#faa,stroke:#f66,stroke-width:4px,color:#fff,stroke-dasharray: 5 5;
    class VM, rouge;
    classDef sec fill:#aff,stroke:#025,stroke-width:2px,color:#003;
    class AZ, sec;
    classDef ter fill:#f0f,stroke:#025,stroke-width:2px,color:#003;
    class BDD, ter;
    classDef vert fill:#af0,stroke:#025,stroke-width:2px,color:#003;
    class proxy,appGW,Serv, vert;
    classDef blanc fill:#fff,stroke:#025,stroke-width:2px,color:#003;
    class Web, blanc;

```
