#!/usr/bin/env sh
mkdir -p .cache
cd .cache
lastVersion="1.14.0"
if [ ! -f google-java-format-$lastVersion-all-deps.jar ]
then
    curl -LJO "https://github.com/google/google-java-format/releases/download/v$lastVersion/google-java-format-$lastVersion-all-deps.jar"
    chmod 755 google-java-format-$lastVersion-all-deps.jar
fi
cd ..

java \
--add-exports jdk.compiler/com.sun.tools.javac.api=ALL-UNNAMED \
--add-exports jdk.compiler/com.sun.tools.javac.file=ALL-UNNAMED \
--add-exports jdk.compiler/com.sun.tools.javac.parser=ALL-UNNAMED \
--add-exports jdk.compiler/com.sun.tools.javac.tree=ALL-UNNAMED \
--add-exports jdk.compiler/com.sun.tools.javac.util=ALL-UNNAMED \
-jar .cache/google-java-format-$lastVersion-all-deps.jar --replace *.java
