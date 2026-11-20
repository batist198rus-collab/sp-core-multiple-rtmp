# SP-CORE Multiple RTMP

Плагин мультистриминга для OBS Studio от [SP CORE](https://sp-core.ru).

Один эфир → несколько RTMP-целей (Twitch, YouTube и др.) из dock-панели OBS.

## Основа

Форк [sorayuki/obs-multi-rtmp](https://github.com/sorayuki/obs-multi-rtmp) (GPL-2.0).  
Исходный автор: **SoraYuki**. См. [NOTICE](./NOTICE).

## Планы SP CORE

- Ребренд и собственные сборки под OBS
- Авторизация в кабинет SP CORE из плагина
- Автоподстановка RTMP URL и stream key из подключений сайта
- Ссылка на загрузки в профиле sp-core.ru

## Сборка

Проект на базе [obs-plugintemplate](https://github.com/obsproject/obs-plugintemplate).

Требования (Windows x64): Visual Studio 2022, CMake 3.28+, Qt6 (через obs-deps).

```powershell
# из корня репозитория, после настройки окружения как в obs-plugintemplate
cmake --preset windows-x64
cmake --build --preset windows-x64
```

Целевая версия OBS: см. `buildspec.json` (`obs-studio.version`).

## Установка (после сборки)

Каталог плагина:

`%ProgramData%\obs-studio\plugins\sp-core-multiple-rtmp\`

Либо installer: `sp-core-multiple-rtmp-setup.exe`.

## Лицензия

GPL-2.0 — см. [LICENSE](./LICENSE).
