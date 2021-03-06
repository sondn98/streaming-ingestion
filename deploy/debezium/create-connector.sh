curl -iX POST http://localhost:8083/connectors/ -H "Accept:application/json" -H "Content-Type:application/json" -d \
'{
    "name": "sondn-mysql-av",
    "config": {
        "connector.class": "io.debezium.connector.mysql.MySqlConnector",
        "tasks.max": "1",
        "database.hostname": "mysql.mysql.svc",
        "database.port": "3306",
        "database.user": "root",
        "database.password": "root",
        "database.server.name": "sondn-mysql",
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
        "key.converter.schema.registry.url": "http://schema-registry-cp-schema-registry:8081",
        "value.converter": "io.confluent.connect.avro.AvroConverter",
        "value.converter.schema.registry.url": "http://schema-registry-cp-schema-registry:8081"
    }
}'
