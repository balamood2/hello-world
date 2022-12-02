FROM centos:latest
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

RUN yum install java -y
#RUN mkdir /opt/tomcat
WORKDIR /opt/
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.69/bin/apache-tomcat-9.0.69.tar.gz /opt/
RUN tar -zxvf ./apache-tomcat-9.0.69.tar.gz
RUN mv apache-tomcat-9.0.69 tomcat
RUN ls
EXPOSE 8080
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
