@echo off

REM build
call npm run build || goto :error


REM navigate into the build output directory
cd dist  || goto :error

git init  || goto :error
git add -A  || goto :error
git commit -m 'deploy'  || goto :error

REM if you are deploying to https://<USERNAME>.github.io/<REPO>
REM [TODO] : Replace with your username and Repository name
git push -f git@github.com:shannonkok/bt3103-header-template.git master:gh-pages  || goto :error

cd -  || goto :error

:error
echo Failed with error #%errorlevel%. 
exit /b %errorlevel%
