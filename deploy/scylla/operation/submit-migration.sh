export JAR_NAME=scylla-migrator-assembly-0.0.1.jar
export CONFIG_FILE=scylla-migration-config.yaml

spark-submit \
 --name ScyllaMigratorApplication \
 --class com.scylladb.migrator.Migrator \
 --conf spark.scylla.config=${CONFIG_FILE} \
 --conf spark.executor.cores=4 \
 --deploy-mode client \
 --jars ${JAR_NAME}  \
 --master local[*] \
 ${JAR_NAME}