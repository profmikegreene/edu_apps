FROM ruby:2.2

RUN apt-get update && apt-get install -y \
postgresql-9.4 \
postgresql-server-dev-9.4 \
libpq-dev


COPY . .

RUN gem install bundler
RUN bundle install
RUN ruby parse_lti_examples.rb
RUN rackup config.ru
