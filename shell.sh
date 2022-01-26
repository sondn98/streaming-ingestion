if [[ "$1" == "mysql" ]]; then
    docker exec -it streaming-ingestion_mysql_1 mysql -uroot -proot
elif [[ "$1" == "cassandra" ]]; then
    docker exec -it streaming-ingestion_cassandra_1 cqlsh -ucassandra -pcassandra
elif [[ "$1" == "scylladb" ]]; then
    docker exec -it streaming-ingestion_scylladb_1 cqlsh
fi
