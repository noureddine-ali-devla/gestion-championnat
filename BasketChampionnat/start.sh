#!/bin/bash
set -e

echo "🚀 Initialisation de l'environnement Tomcat pour le projet BasketChampionnat..."

# === 1. INSTALLATION DES DÉPENDANCES ===
if ! command -v java &> /dev/null; then
  echo "☕ Installation de OpenJDK 17..."
  sudo apt update -y
  sudo apt install -y openjdk-17-jdk wget unzip
fi

# === 2. INSTALLATION DE TOMCAT SI ABSENT ===
if [ ! -d "$HOME/tomcat" ]; then
  echo "📦 Téléchargement et installation de Tomcat 10..."
  wget -q https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.48/bin/apache-tomcat-10.1.48.zip -O /tmp/tomcat.zip
  unzip -q /tmp/tomcat.zip -d $HOME/
  mv $HOME/apache-tomcat-10.1.48 $HOME/tomcat
  chmod +x $HOME/tomcat/bin/*.sh
  echo "✅ Tomcat installé dans $HOME/tomcat"
else
  echo "✅ Tomcat déjà présent."
fi

# === 3. STRUCTURE DU DÉPLOIEMENT ===
APP_SRC="/workspaces/gestion-championnat"
TOMCAT_WEBAPP="$HOME/tomcat/webapps/ROOT"

echo "🧩 Préparation du dossier de déploiement..."
rm -rf "$TOMCAT_WEBAPP"
mkdir -p "$TOMCAT_WEBAPP/WEB-INF/classes"

# === 4. COPIE DES FICHIERS JSP, CONFIG ET RESSOURCES ===
echo "📁 Copie des fichiers du projet..."
cp -r $APP_SRC/webapp/* "$TOMCAT_WEBAPP/" || echo "⚠️ Aucun dossier webapp trouvé"
cp -r $APP_SRC/assets "$TOMCAT_WEBAPP/assets" 2>/dev/null || true

# === 5. COMPILATION DES FICHIERS JAVA ===
if [ -d "$APP_SRC/src" ]; then
  echo "🧠 Compilation des fichiers Java..."
  javac -encoding UTF-8 -cp "$HOME/tomcat/lib/*" -d "$TOMCAT_WEBAPP/WEB-INF/classes" $(find "$APP_SRC/src" -name "*.java")
  echo "✅ Compilation terminée."
else
  echo "⚠️ Aucun dossier src trouvé, rien à compiler."
fi

# === 6. LANCEMENT DU SERVEUR TOMCAT ===
echo "🚀 Démarrage du serveur Tomcat..."
cd $HOME/tomcat/bin
./catalina.sh run
