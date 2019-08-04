FROM ruby:2.6.0
ARG RACK_ENV
ARG PORT 
ENV APP_HOME /app
RUN apt-get update -qq && apt-get install -y build-essential
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
ADD . $APP_HOME/
RUN bundle install — without development test
CMD bundle exec middleman build