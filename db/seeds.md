## Importing Heroku prod DB to local DB

1 - Install heroku-pg-transfer plugin
run `heroku plugins:install https://github.com/ddollar/heroku-pg-transfer`
(https://github.com/ddollar/heroku-pg-transfer)

2 - Import
run `env DATABASE_URL=postgres://localhost/qratr_rails_development heroku pg:transfer`
