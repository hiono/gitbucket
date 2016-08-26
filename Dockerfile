FROM tomcat:9-alpine
MAINTAINER hiono <bps@sculd.com>
LABEL version=4.3
ENV DEBIAN_FRONTEND=noninteractive TERM=xterm GITBUCKET_HOME=/var/gitbucket
RUN rm -rf /usr/local/tomcat/webapps/ROOT
Add https://github.com/takezoe/gitbucket/releases/download/4.3/gitbucket.war /usr/local/tomcat/webapps/ROOT.war
RUN (cd /usr/local/tomcat/webapps; ln -s ROOT.war gitbucket-4.3)
RUN (mkdir -p $GITBUCKET_HOME/plugins; cd $GITBUCKET_HOME/plugins; wget -nv -r -A .jar -e robots=off -nd https://github.com/takezoe/gitbucket-gist-plugin/releases)
VOLUME $GITBUCKET_HOME
WORKDIR $GITBUCKET_HOME
EXPOSE 8080
EXPOSE 29418
CMD [ "/usr/local/tomcat/bin/catalina.sh", "run" ]
