#! /bin/bash

JAVA_PATH=/opt/Oracle_Java/jdk1.8.0_72/bin

sudo update-alternatives --install "/usr/bin/java" "java" "${JAVA_PATH}/java" 1
sudo update-alternatives --install "/usr/bin/javac" "javac" "${JAVA_PATH}/javac" 1
sudo update-alternatives --install "/usr/bin/javaws" "javaws" "${JAVA_PATH}/javaws" 1
sudo update-alternatives --install "/usr/bin/jar" "jar" "${JAVA_PATH}/jar" 1 

sudo update-alternatives --set "java" "${JAVA_PATH}/java"
sudo update-alternatives --set "javac" "${JAVA_PATH}/javac"
sudo update-alternatives --set "javaws" "${JAVA_PATH}/javaws"
sudo update-alternatives --set "jar" "${JAVA_PATH}/jar" 
