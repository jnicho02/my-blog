FROM ruby:2.6.0
ARG RACK_ENV
ARG PORT 
ENV APP_HOME /app
ENV BUILD_HOME /github/workspace/ghpages
ENV REMOTE_REPO="https://github.com/jnicho02/jnicho02.github.io.git"
RUN apt-get update -qq && apt-get install -y build-essential
ENV NODE_VERSION=8.10.0
RUN apt-get update && \
    apt-get install wget curl ca-certificates rsync -y
RUN wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
ENV NVM_DIR=/root/.nvm
RUN . "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" &&  nvm use v${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm alias default v${NODE_VERSION}
RUN cp /root/.nvm/versions/node/v${NODE_VERSION}/bin/node /usr/bin/
RUN cp /root/.nvm/versions/node/v${NODE_VERSION}/bin/npm /usr/bin/
RUN /root/.nvm/versions/node/v${NODE_VERSION}/bin/npm install  leasot@latest -g
RUN git clone $REMOTE_REPO $BUILD_HOME
RUN mkdir $APP_HOME
WORKDIR $APP_HOME   
ADD . $APP_HOME/
RUN bundle install --without development test
RUN bundle exec middleman build
