# README

This is a rails docker template based on orats.

## First Time

1. Clone the repo.

2. Run `docker-compose up --build`

3. In a separate terminal

```
docker-compose exec --user "$(id -u):$(id -g)" website rails db:reset
docker-compose exec --user "$(id -u):$(id -g)" website rails db:migrate
```

4. Visit localhost:3000
