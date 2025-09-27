FROM ruby:3.3.1-alpine

RUN apk add --no-cache \
    build-base \
    postgresql-dev \
    nodejs \
    npm \
    git \
    tzdata \
    imagemagick \
    vips-dev

WORKDIR /app

RUN gem install rails -v 7.1.3.2

COPY Gemfile* ./
RUN bundle install

COPY . .



EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]