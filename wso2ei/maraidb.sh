service ssh restart
cat ~/.ssh/id_rsa.pub | ssh root@wso2ei "cat >> ~/.ssh/authorized_keys"
ssh root@wso2ei 'hostname -i'

mysql -u root -h localhost -P 3306 -pregadmin -e "UPDATE mysql.user SET Password = PASSWORD('regadmin') WHERE User = 'root'; FLUSH PRIVILEGES";
mysql -u root -h localhost -P 3306 -pregadmin -e "SELECT host FROM mysql.user WHERE User = 'root'";
mysql -u root -h localhost -P 3306 -pregadmin -e "CREATE USER 'root'@'$(hostname -i)' IDENTIFIED BY 'regadmin'"; 
mysql -u root -h localhost -P 3306 -pregadmin -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'$(hostname -i)'";
mysql -u root -h localhost -P 3306 -pregadmin -e "FLUSH PRIVILEGES"; 
mysql -u root -h localhost -P 3306 -pregadmin -e "CREATE USER 'root'@'mysql' IDENTIFIED BY 'regadmin'"; 
mysql -u root -h localhost -P 3306 -pregadmin -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'mysql'";
mysql -u root -h localhost -P 3306 -pregadmin -e "FLUSH PRIVILEGES";
mysql -u root -h localhost -P 3306 -pregadmin -e "CREATE USER 'root'@'wso2ei' IDENTIFIED BY 'regadmin'"; 
mysql -u root -h localhost -P 3306 -pregadmin -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'wso2ei'";
mysql -u root -h localhost -P 3306 -pregadmin -e "FLUSH PRIVILEGES";
mysql -u root -h localhost -P 3306 -pregadmin -e "create database regdb"; 
mysql -u root -h localhost -P 3306 -pregadmin -e "GRANT ALL ON regdb.* TO root@mysql IDENTIFIED BY 'regadmin'";
mysql -u root -h localhost -P 3306 -pregadmin -e "FLUSH PRIVILEGES";
mysql -u root -h localhost -P 3306 -pregadmin -e "SELECT host FROM mysql.user WHERE User = 'root'";
mysql -u root -h localhost -P 3306 -pregadmin -e "show databases";
mysql -u root -h localhost -P 3306 -pregadmin -e "CREATE USER 'root'@'$(ssh root@wso2ei 'hostname -i')' IDENTIFIED BY 'regadmin'";
mysql -u root -h localhost -P 3306 -pregadmin -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'$(ssh root@wso2ei 'hostname -i')'";
mysql -u root -h localhost -P 3306 -pregadmin -e "FLUSH PRIVILEGES";
mysql -u root -h localhost -P 3306 -pregadmin -e "SELECT host FROM mysql.user WHERE User = 'root'";
ssh root@mysql 'service ssh restart'