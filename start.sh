#!/bin/bash
set -e

echo "Initialisation du projet BasketChampionnat..."

if ! command -v java &> /dev/null; then
  sudo apt update -y
  sudo apt install -y openjdk-17-jdk wget unzip
fi

if [ ! -d "$HOME/tomcat" ]; then
  wget -q https://archive.apache.org/dist/tomcat/tomcat-10/v10.1.48/bin/apache-tomcat-10.1.48.zip -O /tmp/tomcat.zip
  unzip -q /tmp/tomcat.zip -d $HOME/
  mv $HOME/apache-tomcat-10.1.48 $HOME/tomcat
  chmod +x $HOME/tomcat/bin/*.sh
fi

APP_SRC="/workspaces/gestion-championnat/BasketChampionnat"
TOMCAT_WEBAPP="$HOME/tomcat/webapps/ROOT"

rm -rf "$TOMCAT_WEBAPP"
mkdir -p "$TOMCAT_WEBAPP/WEB-INF/classes"

cp -r $APP_SRC/WebContent/* "$TOMCAT_WEBAPP/" || true
cp -r $APP_SRC/lib "$TOMCAT_WEBAPP/WEB-INF/" || true

if [ -d "$APP_SRC/src" ]; then
  javac -encoding UTF-8 -cp "$APP_SRC/lib/*:$HOME/tomcat/lib/*" -d "$TOMCAT_WEBAPP/WEB-INF/classes" $(find "$APP_SRC/src" -name "*.java")
fi

cd $HOME/tomcat/bin
./catalina.sh run


