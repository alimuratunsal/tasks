Task 1 --->
task1a.py	
task1b
passwd_file.txt	password file
------------------------------------------------------------------------------------------------------
Task 2 --->
fulldeployment.sh
deployment.yaml	
ingress-service.yaml	
service.yaml
flask_web folder
------------------------------------------------------------------------------------------------------
flask_web folder (Task 2) --->
->Dockerfile
->hello.py	flask_web
->requirements.txt
------------------------------------------------------------------------------------------------------
Hi!
In task 2, If you want to fully automatic deployment just run fulldeployment.sh after the git clone command.
  ```
  sh fulldeployment.sh
  ```
or you can run yaml files respectively.
  ```
  1.deployment.yaml
  2.service.yaml
  3.ingress-service.yaml
  ```
---
Notice 1: Also you have to create a secret (my-first-secret) to run ingress-service.yaml (Please see ingress-service.yaml). Run the following commands respectively.
---
  ```
  openssl genrsa -out example.key 2048
  openssl req -new -key example.key -out example.csr
  openssl x509 -req -days 365 -in example.csr -signkey example.key -out example.crt
  kubectl create secret tls my-first-secret --cert example.crt --key example.key

  ```
---
Notice 2: Deployment (2 Replica), Service (HTTP) and Ingress (HTTPS) steps take 2-3 minutes to run fully. Deployment and Service (http url) start in 1 minute, while Ingress (https url) starts in approximately 6-7 minutes. In fulldeployment.sh you can check the status of the steps with the commands I wrote as comments.
---
  

 You can also see the details of fulldeployment.sh scripts details below.
--
 ```
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
```
External IP address of the application.
-----
kubectl get service alimurat-hello-app
http://34.107.203.111/
http://34.107.203.111/status

kubectl get ingress ingress-alimurat-hello-app
https://34.107.203.111/
https://34.107.203.111/status
