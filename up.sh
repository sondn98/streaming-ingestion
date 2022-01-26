export LOCAL_RUN_DIR=/tmp/si-2
docker-compose up -d --remove-orphans
echo "sonbeo1998" | sudo -s chmod -R 777 $LOCAL_RUN_DIR
docker-compose up -d --remove-orphans
