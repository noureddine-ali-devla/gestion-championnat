#!/bin/bash
set -e

echo "Initialisation de Tomcat pour BasketChampionnat..."

# 1. Installation JDK
if ! command -v java &>/dev/null; then
  sudo apt update -y
  sudo apt install -y openjdk-17-jdk wget unzip
fi

# 2. Installation Tomcat
if [ ! -d "$HOME/tomcat" ]; then
  wget -q https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.93/bin/apache-tomcat-9.0.93.tar.gz -O /tmp/tomcat.tar.gz
  tar -xzf /tmp/tomcat.tar.gz -C $HOME
  mv $HOME/apache-tomcat-9.0.93 $HOME/tomcat
  chmod +x $HOME/tomcat/bin/*.sh
fi

# 3. Déploiement
APP_SRC="/workspaces/gestion-championnat/BasketChampionnat"
TOMCAT_WEBAPP="$HOME/tomcat/webapps/ROOT"

rm -rf "$TOMCAT_WEBAPP"
mkdir -p "$TOMCAT_WEBAPP/WEB-INF/classes"

cp -r "$APP_SRC/WebContent/"* "$TOMCAT_WEBAPP/"

# 4. Compilation
if [ -d "$APP_SRC/src" ]; then
  javac -encoding UTF-8 -cp "$HOME/tomcat/lib/*" -d "$TOMCAT_WEBAPP/WEB-INF/classes" $(find "$APP_SRC/src" -name "*.java")
fi

# 5. Lancement Tomcat
cd "$HOME/tomcat/bin"
./catalina.sh run
