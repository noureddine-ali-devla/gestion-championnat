#!/bin/bash
set -e

if ! command -v java &> /dev/null; then
  sudo apt update -y
  sudo apt install -y openjdk-17-jdk wget unzip
fi

if [ ! -d "$HOME/tomcat" ]; then
  wget -q https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.48/bin/apache-tomcat-10.1.48.zip -O /tmp/tomcat.zip
  unzip -q /tmp/tomcat.zip -d $HOME/
  mv $HOME/apache-tomcat-10.1.48 $HOME/tomcat
  chmod +x $HOME/tomcat/bin/*.sh
fi

APP_SRC="/workspaces/gestion-championnat/BasketChampionnat"
TOMCAT_WEBAPP="$HOME/tomcat/webapps/ROOT"

rm -rf "$TOMCAT_WEBAPP"
mkdir -p "$TOMCAT_WEBAPP/WEB-INF/classes"

cp -r $APP_SRC/WebContent/* "$TOMCAT_WEBAPP/" || true
cp -r $APP_SRC/assets "$TOMCAT_WEBAPP/assets" 2>/dev/null || true

LIB_PATH="$APP_SRC/lib/*"
SRC_PATH="$APP_SRC/src"

if [ -d "$SRC_PATH" ]; then
  javac -encoding UTF-8 -cp "$LIB_PATH:$HOME/tomcat/lib/*" -d "$TOMCAT_WEBAPP/WEB-INF/classes" $(find "$SRC_PATH" -name "*.java")
fi

cd $HOME/tomcat/bin
./catalina.sh run
