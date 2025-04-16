#!/bin/bash
# start-environment.sh
echo "Démarrage de l'environnement HBase complet..."
docker-compose up -d
echo "Attente de 30 secondes pour permettre aux services de démarrer..."
sleep 30
echo "Environnement démarré ! Accès aux interfaces web:"
echo "- HBase Master UI: http://localhost:16010"
echo "- HDFS NameNode UI: http://localhost:9870"
echo "- DataNode UI: http://localhost:9864"
echo ""
echo "Pour accéder au shell HBase:"
echo "docker exec -it hbase hbase shell"