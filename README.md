Projet HBase avec Docker
Ce projet fournit un environnement complet pour HBase avec HDFS, ZooKeeper et Phoenix Query Server, le tout fonctionnant dans des conteneurs Docker orchestrés via Docker Compose.
Prérequis

Docker (version 19.03.0+)
Docker Compose (version 1.27.0+)
Au moins 8 Go de RAM disponible
Au moins 10 Go d'espace disque disponible

Structure du projet
projet-hbase/
├── docker-compose.yml       # Configuration des services Docker
├── scripts/                 # Scripts utilitaires
│   ├── start-environment.sh # Script de démarrage
│   └── hbase-commands.txt   # Exemples de commandes HBase
└── README.md                # Documentation
Démarrage rapide

Clonez ce dépôt :
git clone [URL_DU_REPO]
cd projet-hbase

Démarrez l'environnement :
docker-compose up -d

Vérifiez que tous les services sont opérationnels :
docker-compose ps

Accédez au shell HBase :
docker exec -it hbase hbase shell


Services inclus

ZooKeeper : Coordonne les services distribués
HDFS : Système de fichiers distribué pour stocker les données HBase

NameNode : Gère les métadonnées du système de fichiers
DataNode : Stocke les blocs de données


HBase : Base de données NoSQL orientée colonnes

Master : Gère le cluster HBase
RegionServer : Traite les requêtes de données


Phoenix : Couche SQL sur HBase (optionnel)

Interfaces Web

HBase Master UI : http://localhost:16010
HDFS NameNode : http://localhost:9870
HDFS DataNode : http://localhost:9864

Exemples de commandes HBase
Une fois connecté au shell HBase, vous pouvez exécuter les commandes suivantes pour tester votre installation :
# Créer une table
create 'users', 'info', 'contact'

# Insérer des données
put 'users', 'user1', 'info:prenom', 'ahmed'
put 'users', 'user1', 'info:nom', 'tazi'
put 'users', 'user1', 'contact:email', 'ahmed.tazi@example.com'

# Lire des données
get 'users', 'user1'
scan 'users'

# Lister les tables
list
Persistance des données
Toutes les données sont persistées via des volumes Docker nommés :

zookeeper_data et zookeeper_datalog : Données ZooKeeper
hadoop_namenode et hadoop_datanode : Données HDFS
hbase_data : Données HBase

Arrêt et nettoyage
Pour arrêter tous les services :
docker-compose down
Pour supprimer tous les volumes et données persistées :
docker-compose down -v
Dépannage
Si vous rencontrez des problèmes :

Vérifiez les logs :
docker-compose logs [service]

Redémarrez un service spécifique :
docker-compose restart [service]

Assurez-vous que votre machine dispose de ressources suffisantes
