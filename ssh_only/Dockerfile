FROM centos:7
RUN \
  yum -y install openssh-clients openssh-server && \
  yum -y clean all && \
  touch /run/utmp && \
  chmod u+s /usr/bin/ping && \
  echo "root:root" | chpasswd

 

COPY entrypoint.sh /
EXPOSE 22
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["sh","/entrypoint.sh"]

