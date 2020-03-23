### Run a 3 node stack with basic options

### Nginx
```docker container run --detach --publish 80:80 --name loadbalancer nginx```
```curl localhost 80```

### Apache
```docker container run --detach --publish 8080:80 --name middleware httpd```
```curl localhost 8080```

### MySQL
```docker container run --detach --publish 3306:3306 --env MYSQL_RANDOM_ROOT_PASSWORD=yes --name database mysql```

1. Download [this CLI client](https://dev.mysql.com/downloads/shell/)
2. Run ```mysqlsh root@localhost:3306```
3. Reference the password from the ```docker container logs database```
4. Switch to sql mode with ```\sql```
5. Run ```SHOW DATABASES;```
6. Quit the session with ```\quit```

### Use Mysql to connect to MySql
```docker run -it --rm mysql mysql -h ${Container IP} -u root -p```
An image can take parameters when invoked, here we are passing mysql -h (host), -u (user) & -p (password)