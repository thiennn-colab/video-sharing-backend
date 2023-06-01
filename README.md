# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:
se ensure your README.md file includes the following sections:
Introduction: A brief overview of the project, its purpose, and key features.
Prerequisites: List required software and tools, along with their appropriate versions.
Installation & Configuration: Step-by-step instructions for cloning the repository, installing dependencies, and configuring settings.
Database Setup: Instructions for setting up the database, running migrations, and seeding data if necessary.
Running the Application: How to start the development server, access the application in a web browser, and run the test suite.
(BE/FS) Docker Deployment: Instructions for deploying the application using Docker, including building the Docker image and running containers (optional for Backend developer)
Usage: A brief guide outlining how to use the application, including any specific features or functionality the reviewer should be aware of.
Troubleshooting: Common issues that may arise during setup and their potential solutions.

* Introduction
This is the Backend Application of Youtube Video Sharing App which has some features:
- user log in, registration
- viewing youtube videos from your sharing and other sharing links
- like, dislike videos
- share your links, delete your shared videos
- get notifications when other user shares a new video

* Prerequisites

- Ruby version: ruby 3.0.4p208 (2022-04-12 revision 3fa771dded) [x86_64-darwin21]
- Rails version: Rails 7.0.5
- DB: MySQL
- Redis

* Installation & Configuration

- clone this repository
- after you cloned, open a terminal and go to the project dir
- run: `bundle install`


* Database Setup
- run: `rails db:create db:migrate`

* Running the Application

- run: `rails s` (default port is 3000)

* How to run the test suite
I use `rspec` as a testing framework
- to run: `bundle exec rspec`

* ...
