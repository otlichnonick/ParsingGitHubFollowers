# ParsingGitHubFollowers

ФУНКЦИОНАЛ ПРИЛОЖЕНИЯ.
Это клиентское приложение для сервиса GitHub, в котором можно искать аккаунты и просматривать список любимых подписчиков, используя tabBarController для переключения между экранами (search screen & favorites screen)

Список подписчиков загружается с пагинацией по 100 элементов. Каждый элемент списка отображает аватар и логин подписчика. На этом экране реализована возможность поиска подписчиков по логину и добавления в список  favorites. 
При нажатии на элемент списка попадаем на третий экран, на котором отображается подробная информация о подписчике. С этого экрана можно попасть на страницу с профилем в GitHub, либо посмотреть список подписчиков данного человека.

Favorites screen содержит список, элементы которого можно удалять. Для его хранения я использую UserDefaults, так как объем данных небольшой.

ТЕХНОЛОГИЧЕСКИЙ СТЕК И ЕГО ОБОСНОВАНИЕ.
При работе над приложением часто сталкиваешься с тем, что хочется переместить или добавить/удалить некоторые UI элементы, поэтому верстку экранов я осуществлял через код. Так же это позволяет экономить время при настройке переиспользуемых элементов. 
В работе с сетью я применял паттерн синглтон. 
Во избежание повторной загрузки изображений использовал NSCashe. 
Не пользовался сторонними библиотеками и старался все делать нативными методами (знаю плюсы и минусы, тут есть сторонники и противники, в данном проекте я захотел сделать так).
Следуя UI/UX:
- добавил индикатор загрузки при работе с сетью, 
- сообщения об ошибках обрабатываются и отображаются пользователю в виде custom alert, 
- использовал SFSymbols, 
- использовал light/dark mode, 
- использовал динамический размер шрифта,
- использовал системные цвета.

ПЛАНЫ ПО РЕФАКТОРИНГУ.
Старался уменьшить объем кода в файлах viewController, для этого поместил логику по работе с сетью – в NetworkMManager, с хранением данных – в PersistenceManeger. Также использовал файлы extensions для различных типов. Старался следовать принципам DRY и SOLID, чтобы код был более чистым, читаемым и переиспользуемым. В планах поработать над этим. 
