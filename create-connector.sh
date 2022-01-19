if [[ "$1" == "mysql" ]]; then
    curl -i -X POST -H "Accept:application/json" -H "Content-Type:application/json" localhost:8083/connectors/ -d \
    '{
        "name": "sondn-mysql-av",
        "config": {
            "connector.class": "io.debezium.connector.mysql.MySqlConnector",
            "tasks.max": "1",
            "database.hostname": "mysql",
            "database.port": "3306",
            "database.user": "root",
            "database.password": "root",
            "database.server.name": "sondn-mysql-av",
            "database.include.list": "test",
            "database.history.kafka.bootstrap.servers": "kafka:9092",
            "database.history.kafka.topic": "dbhistory.sondn-mysql-av",
            "snapshot.mode": "when_needed",
            "snapshot.new.tables": "parallel",
            "snapshot.locking.mode": "none",
            "snapshot.events.as.inserts": "false",
            "topic.creation.default.partitions":1,
            "topic.creation.default.compression.type": "lz4",
            "topic.creation.default.replication.factor": "1",
            "key.converter": "io.confluent.connect.avro.AvroConverter",
            "key.converter.schema.registry.url": "http://schema-registry:8081",
            "value.converter": "io.confluent.connect.avro.AvroConverter",
            "value.converter.schema.registry.url": "http://schema-registry:8081"
        }
    }'
elif [[ "$1" == "postgresql" ]]; then
    curl -i -X POST -H "Accept:application/json" -H "Content-Type:application/json" localhost:8083/connectors/ -d \
    '{
        "name": "sondn-postgres-av",
        "config": {
            "connector.class": "io.debezium.connector.postgresql.PostgresConnector",
            "tasks.max": "1",
            "database.hostname": "postgresql",
            "database.port": "5432",
            "database.user": "postgres",
            "database.password": "postgres",
            "database.server.name": "sondn-postgres-av",
            "database.dbname": "postgres",
            "schema.include.list": "inventory",
            "database.history.kafka.bootstrap.servers": "kafka:9092",
            "database.history.kafka.topic": "dbhistory.sondn-postgres-av",
            "snapshot.mode": "exported",
            "snapshot.new.tables": "parallel",
            "snapshot.locking.mode": "none",
            "snapshot.events.as.inserts": "false",
            "key.converter": "io.confluent.connect.avro.AvroConverter",
            "key.converter.schema.registry.url": "http://schema-registry:8081",
            "value.converter": "io.confluent.connect.avro.AvroConverter",
            "value.converter.schema.registry.url": "http://schema-registry:8081"
        }
    }'
elif [[ "$1" == "cassandra" ]]; then
    curl -i -X POST -H "Accept:application/json" -H "Content-Type:application/json" localhost:8083/connectors/ -d \
    '{
        "name": "test_cass_sink-1",
        "config":
        {
            "connector.class":"com.datamountaineer.streamreactor.connect.cassandra.sink.CassandraSinkConnector",
            "tasks.max":"1",
            "topics":"sondn-mysql-av.test.my_table_1",
            "key.converter": "io.confluent.connect.avro.AvroConverter",
            "key.converter.schema.registry.url": "http://schema-registry:8081",
            "value.converter": "io.confluent.connect.avro.AvroConverter",
            "value.converter.schema.registry.url": "http://schema-registry:8081",
            "connect.cassandra.contact.points":"cassandra",
            "connect.cassandra.port": "9042",
            "connect.cassandra.key.space": "demo",
            "connect.cassandra.username":"cassandra",
            "connect.cassandra.password":"cassandra",
            "connect.cassandra.kcql": "INSERT INTO orders SELECT * from sondn-mysql-av.test.my_table_1"
        }            
    }'
fi
