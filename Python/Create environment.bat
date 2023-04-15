@echo off
title Creating environment
echo Creating requirements.txt file...
type NUL > requirements.txt
echo Creating main.py file...
echo print("Hello World!") > main.py
echo Creating run.bat file...
echo @echo off > run.bat
echo title Execution >> run.bat
echo call env\Scripts\activate >> run.bat
echo python main.py >> run.bat
echo pause ^> nul >> run.bat
echo Creating setup_requirements.bat file...
echo @echo off > setup_requirements.bat
echo title Installing requirements >> setup_requirements.bat
echo echo Installing requirements... >> setup_requirements.bat
echo call env\Scripts\activate  >> setup_requirements.bat
echo pip install -r requirements.txt >> setup_requirements.bat
echo echo. >> setup_requirements.bat
echo echo Command done, you can close the window >> setup_requirements.bat
echo pause ^> nul >> setup_requirements.bat
echo Creating development environment, do not close the window...
python -m venv env
echo Environment created successfully, you can now close the window...
pause > nul
