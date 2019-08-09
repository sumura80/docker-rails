FROM ruby:2.5.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
WORKDIR /myrailsapp
ADD Gemfile /myrailsapp/Gemfile
ADD Gemfile.lock /myrailsapp/Gemfile.lock
RUN gem install bundler
RUN bundle install
ADD . /myrailsapp