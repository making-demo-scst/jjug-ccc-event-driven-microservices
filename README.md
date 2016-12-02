# jjug-ccc-event-driven-microservices

## Prerequisite

* JDK8 (`JAVA_HOME` must be set)
* `npm`
* `cf` cli

## Install npm modules for UI

```
cd ec-web/ec-web-ui
npm install
cd ../..
cd dlq-recover-service/dlq-recover-ui
npm install
```

## Deploy to PCF Dev

### Start PCF Dev

First of all, we need to downloa PCF Dev from [Pivotal Network](https://network.pivotal.io/products/pcfdev) and install it. It's pretty easy. Please refer the following doc.

* [OSX](https://docs.pivotal.io/pcf-dev/install-osx.html#install-pcf-dev)
* [Linux](https://docs.pivotal.io/pcf-dev/install-linux.html#install-pcf-dev)
* [Windows](https://docs.pivotal.io/pcf-dev/install-windows.html#install-pcf-dev)

After installing, let's start PCF Dev. I would recommend to use 8GB memory for PCFDev.

```
cf dev start -m 8192
```

After around 10~15 minutes, PCF Dev will be ready and you can login with:

```
cf login -a https://api.local.pcfdev.io --skip-ssl-validation -u admin -p admin -o pcfdev-org
```

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
