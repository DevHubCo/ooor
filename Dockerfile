FROM ruby:2.5-alpine

ENV RAILS_VERSION=5.1.7

WORKDIR /app

COPY . .

RUN apk add --no-cache libxml2 libxslt && \
        apk add --no-cache --virtual .gem-installdeps build-base libxml2-dev libxslt-dev && \
        gem install nokogiri -- --use-system-libraries && \
        gem install byebug && \
        rm -rf $GEM_HOME/cache && \
        apk del .gem-installdeps

RUN bundle install

CMD ["rspec"]
