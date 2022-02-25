helm install --set kafka.bootstrapServers="kafka:9092" \
             --set prometheus.jmx.enabled=false \
    cp-helm-charts/charts/cp-schema-registry