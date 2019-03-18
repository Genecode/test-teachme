# Video Views (Test Application)

#### Описание

Проект создан в рамках выполнения тестового задания.  Требовалось написать на Ruby сервис, реализующий REST API со следующими функциями:  "Принимает от клиентов уведомления о том, что клиент смотрит видео. Отвечает на запрос, сколько видео потоков смотрит пользователь в данный момент. Отвечает на вопрос, сколько пользователей смотрят данное видео." 

Ветка с реализацией на Redis https://github.com/Genecode/test-teachme/tree/with_redis

##### Ruby version
```
ruby 2.5
```

##### Ruby on Rails version
```
Rails 5.2
```

### Первый запуск
```
gem install bundler
bundle install
```

Далее необходимо сконфигурировать файлы `config/database.yml` под ваш PG

Подготавливаем базу данных:

```
rails db:create
rails db:migrate
```

Запуск сервера

```
rails s
```
### Документация API
Использован гем `apipie` - описание существующих экшенов и праметров запросов будет доступно по адресу  http://localhost:3000/apipie после запуска сервера. 
