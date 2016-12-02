# jjug-ccc-event-driven-microservices

## Deploy to PCF Dev

### Create services

```
cf create-service p-rabbitmq standard rabbit-binder
cf create-service p-mysql 512mb customer-db
cf create-service p-mysql 512mb point-db
cf create-service p-mysql 512mb zipkin-db
cf create-user-provided-service mailer -p '{"uri":"smtp://<smtp user>:<smtp password>@<smtp hostname>:<smtp port>"}'
```

### Deploy apps

```
./build-and-push-all.sh 
```
