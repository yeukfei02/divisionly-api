FROM timbru31/ruby-node:2.7-slim-14

RUN mkdir -p /app

WORKDIR /app

COPY ./ .

RUN gem install bundler

RUN bundle install

RUN yarn

EXPOSE 3000

CMD [ "bundle", "exec", "rails", "s", "-b", "0.0.0.0" ]
