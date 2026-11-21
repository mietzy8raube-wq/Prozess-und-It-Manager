@echo off
rem DTC Prozess- und IT-Manager starten: eigenes Programmfenster, kein Konsolenfenster.
rem Gleich wie die Desktop-Verknuepfung "Prozess- & IT-Manager". Zur Fehlersuche: mit dem Zusatz "konsole" starten.
rem Auf einem neuen Rechner zuerst "Post-Studio einrichten.bat" im Ordner "Umbau dtC" ausfuehren.
cd /d "%~dp0Programm"
if /i "%~1"=="konsole" goto konsole
python -c "import PIL, docx, openpyxl, pptx, qrcode" >nul 2>nul || goto fehlt
where pythonw >nul 2>nul && (start "" pythonw prozess_it_manager_server.py --app & exit /b)
start "" python prozess_it_manager_server.py --app
exit /b
:konsole
title DTC Prozess- und IT-Manager (Konsole)
python prozess_it_manager_server.py
pause
exit /b
:fehlt
echo Python oder die Zusaetze Pillow, python-docx, openpyxl, python-pptx, qrcode fehlen auf diesem Rechner.
echo Bitte zuerst "Post-Studio einrichten.bat" im Ordner "Umbau dtC" ausfuehren
echo oder:  python -m pip install pillow python-docx openpyxl python-pptx qrcode pywin32
pause
