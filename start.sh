echo "Start Database"
docker run --name conftracker-db -d --rm --network conftracker \
 -e MYSQL_USER=conftracker -e MYSQL_PASSWORD=conftracker \
 -e MYSQL_DATABASE=conftracker -e MYSQL_ROOT_PASSWORD=conftrackerroot \
 -v $(pwd)/data:/var/lib/mysql:z mysql:5.7
sleep 10

echo "Starting Keycloak and waiting for a few seconds..."
docker run -e KEYCLOAK_IMPORT=/tmp/realm-export.json \
  -e KEYCLOAK_USER=admin -e KEYCLOAK_PASSWORD=admin \
  -e DB_VENDOR=mysql -e DB_ADDR=conftracker-db \
  -e DB_DATABASE=conftracker -e DB_USER=conftracker \
  -e DB_PASSWORD=conftracker \
  -v $(pwd)/keycloak/realm-export.json:/tmp/realm-export.json:z \
  -d --rm --name keycloak --network conftracker \
  -p 8080:8080 jboss/keycloak:12.0.1
sleep 30

echo "Start phpMyAdmin on port 8888"
 docker run -d --rm --name conftracker-phpmyadmin --network conftracker \
 -e MYSQL_ROOT_PASSWORD=conftrackerroot -e PMA_HOST=conftracker-db \
 -p 8888:80 phpmyadmin/phpmyadmin

echo "Starting back end server in dev mode with nodemon -- port 3003"
cd server
docker run -d --rm --name conftracker-back --network conftracker \
 -e PORT=3000 -p 3003:3000 \
 -e MYSQL_USER=conftracker -e MYSQL_PASSWORD=conftracker \
 -e MYSQL_DATABASE=conftracker -e MYSQL_HOST=conftracker-db \
 -v $(pwd):/opt/app:z -w /opt/app \
 joellord/nodemon:14 nodemon .
cd ..

echo "Ready to start front end locally"
cd front
npm start

echo "Ready to shut down everything"
docker stop conftracker-back conftracker-db conftracker-phpmyadmin keycloak
