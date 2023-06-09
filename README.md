# README

### Introduction
This is the Backend Application of Youtube Video Sharing App which has some features:
- user log in, registration
- viewing youtube videos from your sharing and other sharing links
- like, dislike videos
- share your links, delete your shared videos
- get notifications when other user shares a new video

### Prerequisites

- Ruby version: ruby 3.0.4p208 (2022-04-12 revision 3fa771dded) [x86_64-darwin21]
- Rails version: Rails 7.0.5
- DB: MySQL
- Redis

### Installation & Configuration

- clone this repository
- after you cloned, open a terminal and go to the project dir
- run: `bundle install`


### Database Setup
- run: `rails db:create db:migrate`

### Running the Application

- run: `rails s` (default port is 3000)

### How to run the test suite
I use `rspec` as a testing framework
- to run: `bundle exec rspec`

* ...

## For Docker using
- run build: `docker-compose build`
- run start: `docker-compose up`
- run create DB table: `docker-compose run app rails db:create`
- run migration: `docker-compose run app rails db:migrate`
