<b>Инструкция по установке cs-cart с дополнением department</b>

1. Клонируйте репозиторий с переданной ссылки в вашу доменную папку.
2. Переходим в ветку department "git checkout department".
3. Добавьте свой config.local.php файл в корень клонированного проекта, в нем:

    + поменяйте значение в поле $config['db_name'] на 'cscartdepartment'
    + поменяйте значение в поле ['admin_index'] на 'md_admin.php'

4. Необходимо импортировать базу данных через phpmyadmin. Для этого заходим в phpmyadmin, в таблице слева выбираем "Создать БД". Даем имя базе данных - "cscartdepartment", нажимаем "Создать". Затем нажимаем на нашу созданную базу данных (чтобы она была активна) и нажимаем на вкладку Импорт. В поле "Выберите файл" добавляем файл "cscartdepartment.sql", который находится в корне клонированного проекта, и нажимаем на "Импорт".

5. Открываем наше приложение в браузере и тестируем.

    Email админа: admin@example.ru
    
    Пароль админа: '11111'


<b>Тест-кейсы</b>

1. Создание отдела (с добавлением как минимум двух сотрудников)
    + Предусловия: 
        - Есть тестовый магазин с установленной модификацией
        - Есть логин пароль администратора (Логин: admin@example.ru, Пароль: 11111)

    1. Заходим в панель администратора магазина,используя логин и пароль админа (В поле адреса вкладки добавляем md_admin.php - "http://cscartdepartment/md_admin.php")
    2. Нажать вкладку "Покупатели"
    3. Нажать "Отделы"
    4. Проверить, что страница вывода отделов доступна и открывается без ошибок
    5. Нажать на синий плюсик в правой части экрана "Добавить отдел"
    6. Проверить, что страница создания отделадоступна и открывается без ошибок, а такжедоступны поля:
        - логотип
        - название
        - описание
        - руководитель
        - сотрудники
        - статус
        - дата создания
    7. Ввести "Тестовый отдел" в поле "Название"
    8. Нажать на "Добавить сотрудников из списка пользователей"
    9. Проверить, что открылось меню выбора нескольких сотрудников
    10. Выбираем 2х любых сотрудников
    11. Нажимаем "Добавить пользователей и закрыть"
    12. Проверить, что выбранные сотрудники отображаются на странице создания отдела
    13. Нажать "Создать"
    14. Проверить, что вышло опвещение о том чтоотдел был создан успешно
    15. Проверить, что все введенные данные сохранились в полях
    16. Нажать вкладку "Покупатели"
    17. Нажать "Отделы"
    18. Проверить, что на странице с отделами появился "Тестовый отдел"

    + Ожидаемый результат: Страница отделы доступна и открывается без ошибок. Страница создания отдела доступна и открывается без ошибок. На странице создания отделов доступны поля:
        - логотип
        - название
        - описание
        - руководитель
        - сотрудники
        - статус

        Созданный отдел появился на странице с отделами.


2. Удаление отдела
    + Предусловия: 
        - Есть тестовый магазин с установленной модификацией
        - Есть логин пароль администратора (Логин: admin@example.ru, Пароль: 11111)
        - Выполнен первый тест-кейс

        1. Заходим в панель администратора магазина, используя логин и пароль админа
        2. Нажать вкладку "Покупатели"
        3. Нажать "Отделы"
        4. Проверить, что страница вывода отделов доступна и открывается без ошибок
        5. Ставим галочку на строке "Тестовый отдел" 
        6. Нажимаем на шестеренку в правой части экрана
        7. Нажимаем "Удалить выбранные" 
        8. Подтверждаем действие на странице (если появляется)
        9. Проверяем, что выбранный отдел удалился со страницы с отделами

    + Ожидаемый результат: Выбранный отдел удалился из списка отделов


3. Просмотр списка сотрудников в отделе на витрине
    + Предусловия:
        - Есть тестовый магазин с установленной модификацией
        - Тестовый пользователь, есть логин пароль (Логин: test@testov.test, Пароль: department11111)
        - Для тестого пользователя в панели администратора создан отдел

    1. Заходим на главную страницу ветрины магазина ("http://cscartdepartment/")
    2. Нажать "Мой профиль"
    3. Нажать "Войти"
    4. Ввести логин пароль для тестового покупателя
    5. Нажать "Войти"
    6. Нажать "Май профиль"
    7. Нажать на "Отделы"
    8. Проверить, что тестовый отдел доступен нстранице отделов, есть логотип, название отдела и имя тестового пользователя
    9. Нажимаем на название отдела
    10. Проверить, что страница тестового отделдоступна и открывается без ошибок
    11. Проверить наличие логотипа(если загружен), описания отдела и списка сотрудников

    + Ожидаемый результат: Отдел отображается в списке отделов покупателя. Страница отдела открывается без ошибок. На странице отдела имеются логотип, описание и список сотрудников.


<b>Автотест</b>

 Запуск автотеста на Windows

1. Открываем консоль виндовс или OS Panel, (взависимости от использоваемого окружения)
2. Открываем файл "acceptance.suite.yml", расположенный в "cscartdepartment\var\tools\autotests\tests" и меняем адрес в поле "url" (при необходимости)
3. Указываем путь к дерриктории теста "cd ...cscartdepartment\var\tools\autotests"
4. Прописываем команду "php codecept.phar run --steps"
5. Убеждаемся, что тест прошел успешно



