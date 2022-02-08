helm install cassandra bitnami/cassandra --create-namespace -n cassandra \
    --set replicaCount=3 \
    --set resources.limits.cpu=1 \
    --set resources.limits.memory=4Gi \
    --set resources.requests.cpu=1 \
    --set resources.requests.memory=4Gi