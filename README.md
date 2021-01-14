
# Test_task_auth

  

Тестовое задание.

В рамках этого тестового задания, необходимо реализовать вход по пин-коду и биометрии.

## Демонстрация работы

https://youtu.be/FAdIIA4CuMk
  
## Структура проекта
```
- app
Базовые вещи, вроде логера и т.п.
- data
- - repository
Хранилище данных, промежуточный слой между данными и логикой приложения
- - services
Бизнес логика
- I10n
Локализация
- ui
- - theme
Цвета, текста и т.п. настройки отображения интерфейса
- - views
Экраны приложения, каждый экран состоит из view (отображение), viewmodel (логика), repository (данные)
- - widgets
Глобальные виджеты приложения

env.dart
Настройки окружения
main.dart
Стартовая точка приложения
```

## Сборка

Версия Flutter - 1.22.1 (stable)
### Android

Для начала, необходимо скачать и установать Flutter, а также настроить IDE

https://flutter.dev/docs/get-started/install

https://flutter.dev/docs/get-started/editor?tab=vscode

После базовой настройки для запуска необходимо выполнить следующие команды(для Android):



> cd *project dir*

> flutter packages get

> flutter run --release

или для сборки apk

> flutter build apk --release



https://flutter.dev/docs/deployment/android



###  IOS:



> cd *project dir*

> flutter packages get

> flutter build ios

Дальше запускать проект в Xcode



https://flutter.dev/docs/deployment/ios

