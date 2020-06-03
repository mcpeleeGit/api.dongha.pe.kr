#!/bin/bash

REPOSITORY=/home/ec2-user/app/step2
PROJECT_NAME=dongha-webservice

echo "> Build ���� ����"

cp $REPOSITORY/zip/*.jar $REPOSITORY/

echo "> ���� �������� ���ø����̼� pid Ȯ��"

CURRENT_PID=$(pgrep -fl dongha-webservice | grep jar | awk '{print $1}')

echo "���� �������� ���ø����̼� pid: $CURRENT_PID"

if [ -z "$CURRENT_PID" ]; then
    echo "> ���� �������� ���ø����̼��� �����Ƿ� �������� �ʽ��ϴ�."
else
    echo "> kill -15 $CURRENT_PID"
    kill -15 $CURRENT_PID
    sleep 5
fi

echo "> �� ���ø����̼� ����"

JAR_NAME=$(ls -tr $REPOSITORY/*.jar | tail -n 1)

echo "> JAR Name: $JAR_NAME"

echo "> $JAR_NAME �� ������� �߰�"

chmod +x $JAR_NAME

echo "> $JAR_NAME ����"

nohup java -jar \
    -Dspring.config.location=classpath:/application.properties,classpath:/application-real.properties,/home/ec2-user/app/application-oauth.properties,/home/ec2-user/app/application-real-db.properties \
    -Dspring.profiles.active=real \
    $JAR_NAME > $REPOSITORY/nohup.out 2>&1 &