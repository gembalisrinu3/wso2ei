docker-compose up -d
docker exec mysql bash -c "service ssh restart"
docker exec wso2ei bash -c "sh /tmp/wso2ei.sh"

