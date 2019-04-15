# Crowd Checked Backend

This is the repo for the backend of the [Crowd
Checked](https://crowdchecked.com/) application. You can find the Chrome
Extension repo
[here](https://github.com/codemang/crowd-checked-chrome-extension).

## Overview

Crowd Checked is a site where users can leave embedded comments within articles.
Users can highlight sections within articles and leave a comment. Other users
will then see that highlighted section and can view the comment and reply.

## Running

1. Clone the repo.

1. Duplicate the env file template and fill in the missing values at the bottom
    ```
    cp .development.env .env
    ```
1. Create the docker network

    ```
    $ docker network create nginx-proxy
    ```

1. Build and run the docker containers
    ```
    $ docker-compose build
    $ docker-compose up
    ```

4. In a separate terminal create the database

    ```
    $ docker-compose exec --user "$(id -u):$(id -g)" website rails db:reset
    $ docker-compose exec --user "$(id -u):$(id -g)" website rails db:migrate
    ```

5. Visit the site at [localhost:3002](localhost:3002). Depending on your docker setup, you might
   have to find the IP address of the docker machine instead.
