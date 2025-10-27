#!/bin/bash

set -e

echo "=== Initialisation du projet BasketChampionnat ==="

# Détection automatique des variables d'environnement
JAVA_HOME=${JAVA_HOME:-$(dirname $(dirname $(readlink -f $(which java))))}
CATALINA_HOME=${CATALINA_HOME:-/usr/local/tomcat}

if [ ! -d "$JAVA_HOME" ]; then
    echo "Erreur : JAVA_HOME introuvable."
    exit 1
fi

if [ ! -d "$CATALINA_HOME" ]; then
    echo "Erreur : CATALINA_HOME (Tomcat) introuvable."
    exit 1
fi

echo "JAVA_HOME = $JAVA_HOME"
echo "CATALINA_HOME = $CATALINA_HOME"

# Compilation des sources Java
echo "Compilation des fichiers Java..."
SRC_DIR="./src"
BIN_DIR="./WebContent/WEB-INF/classes"
mkdir -p "$BIN_DIR"
find "$SRC_DIR" -name "*.java" > sources.txt
javac -d "$BIN_DIR" -cp "$BIN_DIR:./lib/*" @sources.txt
rm sources.txt

# Copie des bibliothèques dans WEB-INF/lib
echo "Mise à jour des librairies..."
mkdir -p "$BIN_DIR/../lib"
cp -u ./lib/*.jar "$BIN_DIR/../lib/"

# Déploiement dans Tomcat
DEPLOY_DIR="$CATALINA_HOME/webapps/BasketChampionnat"
echo "Déploiement dans Tomcat..."
rm -rf "$DEPLOY_DIR"
cp -r ./WebContent "$DEPLOY_DIR"

# Redémarrage de Tomcat
echo "Redémarrage de Tomcat..."
"$CATALINA_HOME/bin/shutdown.sh" || true
sleep 3
"$CATALINA_HOME/bin/startup.sh"

echo "=== Projet BasketChampionnat déployé avec succès ==="

