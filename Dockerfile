FROM ruby:2.6.2
# RAILS_ENVとRAILS_MASTER_KEYをあと差しできるようにしています
ARG RAILS_ENV
ARG RAILS_MASTER_KEY

ENV APP_ROOT /Users/macbookrm/documents/pgm/rails-t/environment/grade_app
# あと差しした RAILS_ENVと RAILS_MASTER_KEYを環境変数に設定します
ENV RAILS_ENV ${RAILS_ENV}
ENV RAILS_MASTER_KEY ${RAILS_MASTER_KEY}

WORKDIR $APP_ROOT
# まずはGemfile のみを ADD し bundle install を行います
ADD Gemfile $APP_ROOT
ADD Gemfile.lock $APP_ROOT

RUN gem update --system
RUN gem uninstall bundler
RUN rm /usr/local/bin/bundle
RUN rm /usr/local/bin/bundler
RUN gem install bundler
# RUN apt-get update && \
#     apt-get install -y nodejs
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get install -y nodejs

RUN \
  bundle install && \
  rm -rf ~/.gem

ADD . $APP_ROOT

# RAILS_ENVがproduction のとき assets:precompile を実行するようにします
# RUN if [ "${RAILS_ENV}" = "production" ]; then curl -sL https://deb.nodesource.com/setup_10.x | bash - && apt-get install -y nodejs; fi
RUN if [ "${RAILS_ENV}" = "production" ]; then npm install yarn -g; fi
RUN if [ "${RAILS_ENV}" = "production" ]; then bundle exec rails assets:precompile; else export RAILS_ENV=development; fi

EXPOSE  3000
CMD ["rails", "server", "-b", "0.0.0.0"]
