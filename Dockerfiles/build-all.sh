cp ./Dockerfile.front ../front/Dockerfile
cp ./nginx.conf ../front
cp ./start-nginx.sh ../front
cd ../front
docker build --format docker -t joellord/conftracker-front .
rm ./Dockerfile
rm ./nginx.conf
rm ./start-nginx.sh
cd ../Dockerfiles
docker push joellord/conftracker-front

cp ./Dockerfile.back ../server/Dockerfile
cd ../server
docker build --format docker  -t joellord/conftracker-back .
rm ./Dockerfile
cd ../Dockerfiles
docker push joellord/conftracker-back

cp ./Dockerfile.keycloak ../keycloak/Dockerfile
cd ../keycloak
docker build --format docker  -t joellord/conftracker-keycloak .
rm ./Dockerfile
cd ../Dockerfiles
docker push joellord/conftracker-keycloak

cp ./Dockerfile.db ../Dockerfile
cd ..
docker run --name conftracker-db -d --rm --network conftracker \
 -e MYSQL_USER=conftracker -e MYSQL_PASSWORD=conftracker \
 -e MYSQL_DATABASE=conftracker -e MYSQL_ROOT_PASSWORD=conftrackerroot \
 -v $(pwd)/data:/var/lib/mysql:z mysql:5.7
docker exec conftracker-db \
 sh -c 'exec mysqldump --all-databases -uroot -p"$MYSQL_ROOT_PASSWORD"' > init.sql
docker stop conftracker-db
docker build --format docker  -t joellord/conftracker-db .
rm ./init.sql
rm ./Dockerfile
cd ./Dockerfiles
docker push joellord/conftracker-db