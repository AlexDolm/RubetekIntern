# RubetekIntern
Приложение для управления камерами и дверьми умного дома

Условия:
- Кэширование данных в Realm
- Изменение (имя) производится в realm
- При открытие раздела если в базе данных нет, то делаем запрос на сервер, если данные в базе есть то отображаем их + функция принудительного обновления
через pullrefresh;
- Верстка кодом
- Архитектура MVC
- Для сетевого слоя использовать нативные инстументы.

Информацию о текущем статусе дверей и камер приложение получает по сети.
http://cars.cprogroup.ru/api/rubetek/cameras/ - метод получение камер
http://cars.cprogroup.ru/api/rubetek/doors/ - метод получение дверей



