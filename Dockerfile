FROM tomcat:latest
MAINTAINER hiono <bps@sculd.com>
LABEL version=3.7
ENV DEBIAN_FRONTEND=noninteractive TERM=xterm GITBUCKET_HOME=/var/gitbucket
RUN rm -rf /usr/local/tomcat/webapps/ROOT
RUN wget -nv -O /usr/local/tomcat/webapps/ROOT.war https://github.com/takezoe/gitbucket/releases/download/3.7/gitbucket.war
RUN mkdir -p $GITBUCKET_HOME/plugins; (cd $GITBUCKET_HOME/plugins; wget -nv -r -A .jar -e robots=off -nd https://github.com/takezoe/gitbucket-gist-plugin/releases)
VOLUME $GITBUCKET_HOME
EXPOSE 8080
EXPOSE 29418
CMD [ "/usr/local/tomcat/bin/catalina.sh", "run" ]
