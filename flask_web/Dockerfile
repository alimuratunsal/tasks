FROM centos:centos7

MAINTAINER Ali Murat Unsal "alimuratunsal@gmail.com"

RUN yum -y update; yum clean all
RUN yum -y install epel-release
RUN yum -y install python-pip python; yum clean all

# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /root/flask_web/requirements.txt

WORKDIR /flask_web

# Pip upgrade
RUN pip install --upgrade pip

# Pip install the requirements for Dockerfile
RUN pip install flask 
COPY . /flask_web

ENTRYPOINT [ "python" ]

EXPOSE 8888

CMD [ "hello.py" ]
