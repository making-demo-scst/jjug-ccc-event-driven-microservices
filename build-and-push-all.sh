#!/bin/sh

apps="$apps zipkin-server"
apps="$apps customer-service"
apps="$apps post-service"
apps="$apps point-service"
apps="$apps email-service"
apps="$apps ec-web"
apps="$apps dlq-recover-service"

for app in $apps;do
    pushd $app
        ./mvnw clean package -DskipTests=true
        cf push
    popd
done
