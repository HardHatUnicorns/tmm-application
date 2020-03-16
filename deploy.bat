@echo off

set "mvnErr=0"

if "%1" == "-logs" (
    echo Web deployment start!
    call mvn -f ../tmm-web wildfly:deploy || set mvnErr=1
    echo ===================================

    if %mvnErr%==1 echo Web deployment failed!
    if %mvnErr%==0 echo Web deployment success!
    echo ===================================


    set mvnErr=0
    echo ===================================
    echo Server deployment start!
    call mvn -f ../tmm-server  wildfly:deploy || set mvnErr=1
    echo ===================================
    if %mvnErr%==1 echo Server deployment failed!
    if %mvnErr%==0 echo Server deployment success!
    echo ===================================
)

if NOT "%1" == "-logs" (
    echo Web deployment start!
    call mvn -q -f ../tmm-web wildfly:deploy > NUL || set mvnErr=1 > NUL
    echo ===================================

    if %mvnErr%==1 echo Web deployment failed!
    if %mvnErr%==0 echo Web deployment success!
    echo ===================================

    echo \n

    set mvnErr=0
    echo ===================================
    echo Server deployment start!
    call mvn -q -f ../tmm-server  wildfly:deploy > NUL || set mvnErr=1 > NUL
    echo ===================================
    if %mvnErr%==1 echo Server deployment failed!
    if %mvnErr%==0 echo Server deployment success!
    echo ===================================
)


