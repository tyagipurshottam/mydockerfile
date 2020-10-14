#install Docker Commity Engine and usefull command

yum install docker-ce docker-ce-cli containerd.io

#If install yum install docker then network not working then use below command

docker build --network host -t   centos7 .

#Delete all uncessary docker image and docker container

docker system prune -a

##dcokerfile env

RUN echo "VERSION="$(date +"%Y%m%d%s") > .env

chmod 666 /var/run/docker.sock 
sudo usermod -a -G docker [jis user ko dena hai]

ADD run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh


ENTRYPOINT ["sh","/usr/local/bin/run.sh"]

++++++++++++++++++
run.sh


#!/bin/bash


setup(){

NODEIP=`ip a | grep eth0 | grep inet | awk {'print $2'} | sed 's/.$//' | sed 's/.$//' | sed 's/.$//'`
echo ${NODEIP}
date=`date +%d%h%y`
rm -rf /logs
mkdir   /data/node/logs/fusion-consumer/${date}-${NODEIP}/logs -p
ln -s   /data/node/logs/fusion-consumer/${date}-${NODEIP}/logs /logs

}
clamavstart(){

clamd
}

start(){
    
java -Dspring.profiles.active=production,spring -javaagent:/newrelic/newrelic.jar -XX:+UseG1GC -XX:+UseStringDeduplication -Xms2g -Xmx2g -jar /fusion-consumer.jar

}
setup
start
clamavstart

#docker registry error
1.check /etc/docker/certs.d/ # all certificate must be there
2./root/.docker/config.json #certifate and password will  be there

########### Interview best question

docker create to create the container
docker start to run a comtainer
docker run to create and start a container


