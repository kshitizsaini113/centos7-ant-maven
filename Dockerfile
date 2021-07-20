FROM centos:7
RUN curl -O https://download.oracle.com/otn/java/jdk/8u171-b11/512cd62ec5174c3487ac17c61aaa89e8/jdk-8u171-linux-x64.rpm?AuthParam=1626767240_b72abed933df086235bcf44101fe4a99
RUN yum localinstall -y /jdk-8u171-linux-x64.rpm
RUN rm -f /jdk-8u171-linux-x64.rpm
COPY ./java_home.sh /etc/profile.d/java_home.sh
RUN chmod +x /etc/profile.d/java_home.sh
RUN curl -O https://archive.apache.org/dist/ant/binaries/apache-ant-1.10.9-bin.zip
RUN curl -O https://archive.apache.org/dist/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.zip
RUN yum install unzip -y
RUN unzip apache-ant-1.10.9-bin.zip
RUN mv /apache-ant-1.10.9/ /opt/ant
RUN ln -s /opt/ant/bin/ant /usr/bin/ant
COPY ./ant.sh /etc/profile.d/ant.sh
RUN chmod +x /etc/profile.d/ant.sh
RUN unzip apache-maven-3.6.3-bin.zip
RUN mv /apache-maven-3.6.3/ /opt/maven
RUN ln -s /opt/maven/bin/mvn /usr/bin/mvn
COPY ./maven.sh /etc/profile.d/maven.sh
RUN chmod +x /etc/profile.d/maven.sh
RUN yum remove -y unzip
RUN rm -f /apache-ant-1.10.9-bin.zip /apache-maven-3.6.3-bin.zip
