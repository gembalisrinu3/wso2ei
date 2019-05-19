#service ssh restart
cat ~/.ssh/id_rsa.pub | ssh root@mysql "cat >> ~/.ssh/authorized_keys"
ssh root@mysql 'hostname -i'

scp /tmp/maraidb.sh root@mysql:/tmp/
scp /usr/lib/wso2/wso2ei/6.4.0/wso2/business-process/dbscripts/mysql.sql root@mysql:/tmp/
ssh root@mysql 'chmod 777 /tmp/maraidb.sh'
ssh root@mysql 'sh /tmp/maraidb.sh'
ssh -o StrictHostKeyChecking=no -f  root@mysql "mysql -u regadmin -pregadmin -Dregdb < /tmp/mysql.sql;"
#sh /usr/lib/wso2/wso2ei/6.4.0/bin/launcher_business-process.sh -Dsetup
sh /usr/lib/wso2/wso2ei/6.4.0/bin/launcher_business-process.sh -Dsetup
