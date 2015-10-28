FROM tomcat:latest
MAINTAINER hiono <bps@sculd.com>
LABEL version=3.7
ENV DEBIAN_FRONTEND=noninteractive TERM=xterm GITBUCKET_HOME=/var/gitbucket
RUN rm -rf /usr/local/tomcat/webapps/ROOT
Add https://github.com/takezoe/gitbucket/releases/download/3.7/gitbucket.war /usr/local/tomcat/webapps/ROOT.war
RUN (cd /usr/local/tomcat/webapps; ln -s ROOT.war gitbucket-3.7.war)
RUN mkdir -p $GITBUCKET_HOME/plugins
WORKDIR $GITBUCKET_HOME/plugins
RUN wget -nv -r -A .jar -e robots=off -nd https://github.com/takezoe/gitbucket-gist-plugin/releases
VOLUME $GITBUCKET_HOME
WORKDIR $GITBUCKET_HOME
EXPOSE 8080
EXPOSE 29418
CMD [ "/usr/local/tomcat/bin/catalina.sh", "run" ]
