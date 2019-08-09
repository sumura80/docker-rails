## README

DockerでRails環境を構築。
下記にあるDocker Hub から"sumura80/docker-rails"をdocker上で取得します。
https://hub.docker.com/r/sumura80/docker-rails


取得とコンテナの作成と開始方法:
Terminal上で下記のコマンドを実行してください。
1. docker pull sumura80/docker-rails
（イメージの取得）

2. docker-compose build
（サービスの構築・実行）

3. docker-compose run web rake db:create
（データベースの作成）

4. docker-compose up
（サーバーの起動）

5. localhost:3000　にアクセス
  
    
### 環境
アプリ名： myrailsapp
 
Ruby:2.5.0  
 
Rails: 5.1.7
 
DB: postgresql　
 
  
### Dockerfile
````
FROM ruby:2.5.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
WORKDIR /myrailsapp
ADD Gemfile /myrailsapp/Gemfile
ADD Gemfile.lock /myrailsapp/Gemfile.lock
RUN gem install bundler
RUN bundle install
ADD . /myrailsapp
````

  
   
     
### docker-compose.yml
````
version: '3'
services:
  db:
    image: postgres
  web:
    build: .     
    command: bundle exec rails s -p 3000 -b '0.0.0.0'
    ports:
      - "3000:3000"
    volumes:
      - .:/myrailsapp
    depends_on:
      - db
volumes:
  postgresql-data:
    driver: local

````

   
### その他
GitHubとDocker Hubを連携させている。
　
イメージのpullに少し時間がかかる。
