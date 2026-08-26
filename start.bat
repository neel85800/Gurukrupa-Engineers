@echo off
REM Preview the Gurukrupa Engineers website on this computer.
REM Close this window (or press Ctrl+C) to stop it.
cd /d "%~dp0"
python serve.py 8000
pause
