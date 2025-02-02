FROM ubuntu:20.04
RUN apt-get update -y
COPY . /app
WORKDIR /app
RUN apt-get install -y python3-pip mysql-client
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
EXPOSE 8080
ENTRYPOINT ["python3", "app.py"]




## export DBHOST=172.18.0.2
## export DBPORT=3306
## export DBUSER=root
## export DATABASE=employees
## export DBPWD=pw
## export APP_COLOR8081=blue
## export APP_COLOR8082=pink
## export APP_COLOR8083=lime

## docker run -d --name Database -e MYSQL_ROOT_PASSWORD=pw my_db

## docker run -d --name blue -p 8081:8080  -e DBHOST=$DBHOST -e DBPORT=$DBPORT -e  DBUSER=$DBUSER -e DBPWD=$DBPWD -e DATABASE=$DATABASE -e APP_COLOR=$APP_COLOR8081 my_app
## docker run -d --name pink -p 8082:8080  -e DBHOST=$DBHOST -e DBPORT=$DBPORT -e  DBUSER=$DBUSER -e DBPWD=$DBPWD -e DATABASE=$DATABASE -e APP_COLOR=$APP_COLOR8082 my_app
## docker run -d --name lime -p 8083:8080  -e DBHOST=$DBHOST -e DBPORT=$DBPORT -e  DBUSER=$DBUSER -e DBPWD=$DBPWD -e DATABASE=$DATABASE -e APP_COLOR=$APP_COLOR8083 my_app
