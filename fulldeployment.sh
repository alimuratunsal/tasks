#!/bin/bash
echo "Deploying Python flask application (alimurat-hello-app)"
kubectl apply -f deployment.yaml

echo "Exposing alimurat-hello-app service"
kubectl apply -f service.yaml

echo "Exposing Ingress service (ingress-alimurat-hello-app)"
kubectl apply -f ingress-service.yaml

#echo "Lets check the all steps:)"

#echo "Check Deployment (2 Replica Deployment)"
#kubectl get deployment
#kubectl describe deployment alimurat-hello-app

#echo "Check Service (HTTP URl)"
#kubectl get service
#kubectl describe service alimurat-hello-app

#echo "Check Ingress (HTTPS URL) "
#kubectl get ingress
#kubectl describe ingress ingress-alimurat-hello-app

echo "Notice: Full Deployment steps done. Deployment (2 Replica), Service (HTTP) and Ingress (HTTPS) steps take 2-3 minutes to run fully. Deployment and Service (http url) start in 1 minute, while Ingress (https url) starts in approximately 6-7 minutes. In fulldeployment.sh you can check the status of the steps with the commands I wrote as comments. "

