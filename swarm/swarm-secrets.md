#### info ####
* You need atleast docker-compose version 3.1 to use secrets
* secrets can be locked down to per service using std linux file permissions

#### Create a secret ####
```
echo "secure-user" > zz.secure-user.txt 
docker secret create psql_user zz.secure-user.txt
echo "IAmSecure" | docker secret create psql_pass -
docker secret ls
docker secret inspect psql_pass
docker secret inspect psql_user
```

#### Create a service which can use the secret####
```
docker service create --name psql --secret psql_user --secret psql_pass -e POSTGRES_PASSWORD_FILE=/run/secrets/psql_pass -e POSTGRES_USER_FILE=/run/secrets/psql_user postgres
docker service ps psql
docker container ls
docker exec -it psql.1.q5skx3rnizhe9zn9izrxyqcfi bash
```

#### remove a secret from a service (causes a container rebuild)
```docker update --secret-rm psql```