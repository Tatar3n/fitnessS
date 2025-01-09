# FitnessS

## Как подготовить проект к запуску
```bash
gem install bundler
bundle install
npm install
bundle exec rake db:create
bundle exec rake db:migrate
```

## Зайти в postgres
```bash
sudo service postgresql start
sudo -u postgres psql
```

### Список команд в psql
```
\l - список БД
\dt - список таблиц
\q - выйти
\с <database_name> - подключиться к БД
```

### Узнать адрес хоста WSL
`hostname -I`