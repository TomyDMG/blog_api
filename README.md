# README

Эндпоинты:

● Эндпойнт для аутентификации.POST запрос на /api/v1/authenticate формата {"email":":email", "password":":password"} в ответе получаем токен, в дальнейшем ко всем запросам, кроме генерации отчета, добавлять заголовок "Authorization: полученный_токен"

●POST запрос на /api/v1/posts.json

Отправляем: title, body, published_at

В ответ получаем json с полями: id, title, body, published_at, author_nickname 
Если в запросе непередали published_at,то подставляется текущий момент времени.Если передали невсеполя,то ответ содержит поле errors — массив ошибок.


●GET запрос на /api/v1/posts/:post_id.json

Получаем post по его id


●GET запрос на /api/v1/posts.json

Отправляем: page, per_page

Получаем в ответ список записей отсортированных по полю published_at по убыванию поля каждой записи. В заголовках ответа передается общее количество страници записей.


●POST /api/v1/reports/by_author.json

Отправляем: start_date — начало интервала, end_date — конец интервала, email — куда отправить отчёт.

Эндпоинт добавляет задачу на генерацию отчёта в очередь, очередь обрабатывается отдельным процесом. Готовый отчёт отправляется на указанный email.


Использованные технологии:

● Rails 5.0.0.1

● Postgres 9.4

● Rspec 3.5

● Json — ActiveModelSerializer

● Загрузка файлов на Amazon S3 (Paperclip + aws-sdk)

● ActionMailer 

● Sidekiq/Redis

● React JS

● Работающее приложение размещено на heroku: https://volt-blog-app.herokuapp.com/

Тестовый пользователь - "email":"example@mail.com", "password":"123123123"
