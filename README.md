# defold-rustore-review

Оценки и отзывы RuStore Review SDK для Defold — расширение `RuStoreReview`, Lua-модуль `rustorereview`.
Официальный плагин [rustore-defold-review](https://gitflic.ru/project/rustore/rustore-defold-review),
упакованный в библиотеку Defold: на GitFlic он ставится копированием папок, отсюда — строкой в `dependencies`.

| | |
|---|---|
| SDK | `ru.rustore.sdk:review:10.5.1` |
| Источник | rustore-defold-review, `master` от 08.09.2026 (`9329ada`) |
| Нужен core | [defold-rustore-core](https://github.com/maningame/defold-rustore-core) `10.5.0` |
| Платформы | только Android, Defold 1.9+ |
| Документация | [rustore.ru/help/sdk/reviews-ratings/defold/10-5-1](https://www.rustore.ru/help/sdk/reviews-ratings/defold/10-5-1) |

## Подключение

В `[project] dependencies` Android-цели (`platforms/<цель>/platform.settings`, не общий `game.project`) —
вместе с core, сам Defold его не подтянет. Манифест и ресурсы не нужны.

```ini
dependencies#N = https://github.com/maningame/defold-rustore-core/archive/refs/tags/10.5.0.zip
dependencies#M = https://github.com/maningame/defold-rustore-review/archive/refs/tags/10.5.1.zip
```

Только для сборки в RuStore: в Google Play оценку даёт
[extension-review](https://github.com/defold/extension-review).

## Lua

```lua
rustorecore.connect("rustore_request_review_flow_success", on_request_success)
rustorecore.connect("rustore_request_review_flow_failure", on_failure)
rustorecore.connect("rustore_launch_review_flow_success", on_launch_success)
rustorecore.connect("rustore_launch_review_flow_failure", on_failure)

rustorereview.init()
rustorereview.request_review_flow() -- заранее, ответ — в канал request_review_flow
rustorereview.launch_review_flow()  -- показать экран оценки после успешного request
```

Аннотации — `extension_rustore_review/lua/rustorereview_stub.lua`.

## Отличия от GitFlic

- Убран `extension_rustore_review/.gitignore` с правилом `*.jar`: с ним `RuStoreDefoldReview.jar` не попадает
  в git и в zip зависимости, и сборка падает без классов плагина.

## Обновление с GitFlic

1. `git clone https://gitflic.ru/project/rustore/rustore-defold-review.git`, взять `master` или тег.
2. Заменить `extension_rustore_review` на `review_example/extension_rustore_review`, снова удалить
   `.gitignore` внутри неё.
3. Версия `core` в `versions.json` новее нашей — сначала обновить
   [defold-rustore-core](https://github.com/maningame/defold-rustore-core) и ссылку на него в `game.project`.
4. Коммит `build: rustore review <версия>`, тег — версия SDK. Наша правка поверх той же версии — тег
   `<версия>-1`.

## Лицензия

MIT, © RuStore — [MIT-LICENSE.txt](MIT-LICENSE.txt).
