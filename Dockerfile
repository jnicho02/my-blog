FROM ruby:2.6.0
ARG RACK_ENV
ARG PORT 
ENV APP_HOME /app
ENV BUILD_HOME /ghpages
ENV REMOTE_REPO="https://github.com/jnicho02/jnicho02.github.io.git"
RUN apt-get update -qq && apt-get install -y build-essential
RUN git clone $REMOTE_REPO $BUILD_HOME
RUN mkdir $APP_HOME
WORKDIR $APP_HOME   
ADD . $APP_HOME/
RUN bundle install --without development test
RUN bundle exec middleman build