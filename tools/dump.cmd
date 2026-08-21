@echo off
rem ============================================================
rem  MiniRetail: выгрузка конфигурации в файлы (для git)
rem  Запуск: двойной клик или из терминала из папки tools
rem ============================================================
chcp 65001 >nul

set PLAT=X:\1C\8.3.27.1508\bin\1cv8t.exe
set BASE=X:\1C\Bases\MiniRetail
set SRC=%~dp0..\src

if not exist "%SRC%" mkdir "%SRC%"

echo Выгружаю конфигурацию MiniRetail в src ...
"%PLAT%" DESIGNER /F "%BASE%" /DumpConfigToFiles "%SRC%" -update

if errorlevel 1 (
    echo.
    echo [ОШИБКА] Выгрузка не удалась, смотрите сообщение выше.
) else (
    echo.
    echo [OK] Конфигурация выгружена в src. Теперь можно коммитить:
    echo     git add -A ^&^& git commit -m "feat: описание доработки"
)
pause
