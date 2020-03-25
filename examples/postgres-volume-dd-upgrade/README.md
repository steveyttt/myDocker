
### Create the Network
```
docker network create database_network
```

### Provision a postgres instance with a friendly volume name
```
docker run -d --network database_network --name pgdatabase -p 5432:5432 -e POSTGRES_PASSWORD=mysecretpassword -v pgdatabase:/var/lib/postgresql/data postgres:9.6.1
```

### Run a psql client into the build database
```
docker run --network database_network -it --rm postgres:9.6.1 psql -h pgdatabase -U postgres
SELECT 1;
\q
```

### Provision an updated postgres instance with the previous volume 
```
docker run -d --network database_network --name pgdatabase -p 5432:5432 -e POSTGRES_PASSWORD=mysecretpassword -v pgdatabase:/var/lib/postgresql/data postgres:9.6.2
```

### Run a psql client into the build database
```
docker run --network database_network -it --rm postgres:9.6.2 psql -h pgdatabase -U postgres
SELECT 1;
\q
```

### Delete the network
```
docker network rm database_network
```