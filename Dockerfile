FROM ruby:2.4.4

RUN apt-get update -yqq
RUN apt-get install -yqq --no-install-recommends nodejs

COPY Gemfile* /usr/src/app/
WORKDIR /usr/src/app

RUN bundle install
COPY . /usr/src/app/

CMD ["rails", "s", "-p", "3060", "-b", "0.0.0.0"]
