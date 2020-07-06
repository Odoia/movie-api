FROM ruby:2.7.1-slim

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN apt --quiet update && \
    apt --yes --quiet install build-essential curl gzip libpq-dev git && \
    apt update && \
    apt clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    apt-get -y autoremove && \
    gem install rubygems-update && \
    update_rubygems && \
    gem install bundler

RUN bundle install

EXPOSE 3000

CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]
