Task 1
=========
Task 1 Contains: 
[task1a.py](https://github.com/alimuratunsal/tasks/blob/master/task1a.py) 

[task1b](https://github.com/alimuratunsal/tasks/blob/master/task1b)
```bash
$ cut -d':' -f2 < passwd_file.txt | sort | uniq -d
```
[passwd_file.txt](https://github.com/alimuratunsal/tasks/blob/master/passwd_file.txt)

------------------------------------------------------------------------------------------------------
Task 2
=========
Task 2 Contains: 
[flask_web folder](https://github.com/alimuratunsal/tasks/tree/master/flask_web) , [fulldeployment.sh](https://github.com/alimuratunsal/tasks/blob/master/fulldeployment.sh), [deployment.yaml](https://github.com/alimuratunsal/tasks/blob/master/deployment.yaml) , [service.yaml](https://github.com/alimuratunsal/tasks/blob/master/service.yaml), [ingress-service.yaml	](https://github.com/alimuratunsal/tasks/blob/master/ingress-service.yaml)

------------------------------------------------------------------------------------------------------
[flask_web folder](https://github.com/alimuratunsal/tasks/tree/master/flask_web) Contains: 
[Dockerfile](https://github.com/alimuratunsal/tasks/blob/master/flask_web/Dockerfile), [hello.py](https://github.com/alimuratunsal/tasks/blob/master/flask_web/hello.py), [requirements.txt](https://github.com/alimuratunsal/tasks/blob/master/flask_web/requirements.txt) 

------------------------------------------------------------------------------------------------------
Hi!
In Task 2, If you want to fully automatic deployment on k8s cluster, just run [fulldeployment.sh](https://github.com/alimuratunsal/tasks/blob/master/fulldeployment.sh) after the git clone command.
  ```
  $ sh fulldeployment.sh
  ```
or you can apply yaml files respectively.
  ```
  $ kubectl apply -f deployment.yaml
  $ kubectl apply -f service.yaml
  $ kubectl apply -f ingress-service.yaml
  ```
---
Notice 1: Also you have to create a secret (my-first-secret) to run ingress-service.yaml (Please see ingress-service.yaml).
---
Run the following commands respectively.
---
  ```
  $ openssl genrsa -out example.key 2048
  $ openssl req -new -key example.key -out example.csr
  $ openssl x509 -req -days 365 -in example.csr -signkey example.key -out example.crt
  $ kubectl create secret tls my-first-secret --cert example.crt --key example.key

  ```
---
Notice 2: Deployment (Replica Set=2), Service (HTTP) and Ingress (HTTPS) steps take 6-7 minutes to run fully. Deployment and Service (http url) start in 1 minute, while Ingress (https url) starts in approximately 6-7 minutes. In fulldeployment.sh you can check the status of the steps with the commands I wrote as comments.
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
External IP address of the application. (Container Port:8888, External Ports:80,443)
-----
| URL | Yaml File | Description | IP:Port Check Command |
|----------|-------------|-------------|-------------|
| http://34.76.16.230 | service.yaml | / : Returns “HTTP 200” with string “Welcome to my app”” | $ kubectl get service alimurat-hello-app |
| http://34.76.16.230/status | service.yaml| /status : Returns “HTTP 204” without any content. | $ kubectl get service alimurat-hello-app |
| http://34.107.203.111 | ingress-service.yaml | / : Returns “HTTP 200” with string “Welcome to my app”” | $ kubectl get ingress ingress-alimurat-hello-app|
| http://34.107.203.111/status | ingress-service.yaml | /status : Returns “HTTP 204” without any content. | $ kubectl get ingress ingress-alimurat-hello-app |
| https://34.107.203.111/ | ingress-service.yaml | / : Returns “HTTPS 200” with string “Welcome to my app”” | $ kubectl get ingress ingress-alimurat-hello-app |
| https://34.107.203.111/status | ingress-service.yaml | /status : Returns “HTTPS 204” without any content. | $ kubectl get ingress ingress-alimurat-hello-app |
