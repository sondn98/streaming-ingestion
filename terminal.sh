if [[ "$1" == "mysql" ]]; then
    docker exec -it streaming-ingestion_mysql_1 bash
elif [[ "$1" == "cassandra" ]]; then
    docker exec -it streaming-ingestion_cassandra_1 bash
elif [[ "$1" == "scylladb" ]]; then
    docker exec -it streaming-ingestion_scylladb_1 bash
fi