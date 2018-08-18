# README

This is a rails docker template based on orats.

## First Time

1. Clone the repo.

2. Run `cp .development.env .env`

3. Run `docker-compose up --build`

4. In a separate terminal

```
docker-compose exec --user "$(id -u):$(id -g)" website rails db:reset
docker-compose exec --user "$(id -u):$(id -g)" website rails db:migrate
```

5. Visit localhost:3000
