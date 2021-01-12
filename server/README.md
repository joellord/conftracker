## Create a docker network
docker network create conftracker

## Start a DB
docker run --name conftracker-db -d --rm --network conftracker \
 -e MYSQL_USER=conftracker -e MYSQL_PASSWORD=conftracker \
 -e MYSQL_DATABASE=conftracker -e MYSQL_ROOT_PASSWORD=conftrackerroot \
 -v $(pwd)/data:/var/lib/mysql:z mysql:5.7

### Creating database dumps
Most of the normal tools will work, although their usage might be a little convoluted in some cases to ensure they have access to the mysqld server. A simple way to ensure this is to use docker exec and run the tool from the same container, similar to the following:

`docker exec some-mysql sh -c 'exec mysqldump --all-databases -uroot -p"conftrackerroot"' > /some/path/on/your/host/all-databases.sql`
### Restoring data from dump files
For restoring data. You can use docker exec command with -i flag, similar to the following:

`docker exec -i some-mysql sh -c 'exec mysql -uroot -p"conftrackerroot"' < /some/path/on/your/host/all-databases.sql`

## PHPMyAdmin
docker run -d --rm --name conftracker-phpmyadmin --network conftracker \
 -e MYSQL_ROOT_PASSWORD=conftrackerroot -e PMA_HOST=conftracker-db \
 -p 8888:80 phpmyadmin/phpmyadmin

## Dev server
docker run --rm --name conftracker-back --network conftracker \
 -e PORT=3000 -p 3003:3000 \
 -e MYSQL_USER=conftracker -e MYSQL_PASSWORD=conftracker \
 -e MYSQL_DATABASE=conftracker -e MYSQL_HOST=conftracker-db \
 -v $(pwd):/opt/app:z -w /opt/app \
 joellord/nodemon:14 nodemon .

## Prod server

## Keycloak
docker run -e KEYCLOAK_IMPORT=/tmp/realm-export.json \
  -e KEYCLOAK_USER=admin -e KEYCLOAK_PASSWORD=admin \
  -e DB_VENDOR=mysql -e DB_ADDR=conftracker-db \
  -e DB_DATABASE=conftracker -e DB_USER=conftracker \
  -e DB_PASSWORD=conftracker \
  -v $(pwd)/keycloak/realm-export.json:/tmp/realm-export.json:z \
  -d --rm --name keycloak --network conftracker \
  -p 8080:8080 jboss/keycloak:12.0.1

## Start everything up
Start Keycloak and wait until it started before starting the backend server.

Once all the servers are started, start the front end with 
```
cd front && npm start
```

Head to http://localhost:8080 and create a user in Keycloak. Add a `user` role to the realm. Add the role to the user.
