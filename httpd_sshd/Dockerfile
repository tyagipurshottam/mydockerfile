FROM centos:7
MAINTAINER The CentOS Project <cloud-ops@centos.org>
LABEL Vendor="CentOS" \
      License=GPLv2 \
      Version=2.4.6-40


RUN yum -y --setopt=tsflags=nodocs update && \
    yum -y --setopt=tsflags=nodocs install httpd && \
    yum -y --setopt=tsflags=nodocs install openssh-server openssh-clients  rsync augeas shadow rssh && \
    yum -y --setopt=tsflags=nodocs install net-tools && \
    yum clean all

RUN ssh-keygen -A

COPY index.html /var/www/html/index.html

RUN echo "root:redhat" | chpasswd

#RUN sed -i 's/#*PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
#RUN sed -i 's/#*ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/g' /etc/ssh/sshd_config
#RUN sed -i 's/#*PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config

EXPOSE 80
EXPOSE 22

# Simple startup script to avoid some issues observed with container restart
#ADD run.sh /usr/bin/run.sh
ADD xxx.sh /usr/bin/xxx.sh
#ADD sshd.sh /sshd.sh
#RUN chmod +x /sshd.sh
#RUN ./sshd.sh

#RUN chmod -v +x /usr/bin/run.sh
RUN chmod -v +x /usr/bin/xxx.sh

ENTRYPOINT ["/usr/bin/xxx.sh"]
#- command
CMD ["START"]
