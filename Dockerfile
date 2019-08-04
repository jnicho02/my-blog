FROM ruby:2.6.0
ARG RACK_ENV
ARG PORT 
ENV APP_HOME /app
ENV BUILD_HOME /ghpages
ENV REMOTE_REPO="https://jnicho02@github.com/jnicho02.github.io.git"
RUN apt-get update -qq && apt-get install -y build-essential
RUN mkdir $APP_HOME
RUN mkdir $BUILD_HOME
WORKDIR $BUILD_HOME
ADD . $BUILD_HOME/
RUN git checkout $REMOTE_REPO
WORKDIR $APP_HOME
ADD . $APP_HOME/
RUN bundle install --without development test