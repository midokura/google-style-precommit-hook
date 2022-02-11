#!/usr/bin/env sh
error_and_quit() {
    echo "Midokura's Java Formatter Usage:";
    echo "./format-code.sh -v latestVersion";
    echo "latestVersion is the latest Google's Formatter version";
    return 1;
}

while getopts v: flag
do 
    case "${flag}" in
        v) formatter_version=${OPTARG##*( )};;
    esac
done

all_java_files=$(find ./ -name "*.java")

if [ -z  "$formatter_version" ]; then 
    error_and_quit
else
    if [ -z "$2" ]; then
        echo "There are no files to format."
    else
        mkdir -p .cache
        echo "Using Google Formatter v$formatter_version"

        cd .cache
        if [ ! -f google-java-format-$formatter_version-all-deps.jar ]
        then
            curl -LJO "https://github.com/google/google-java-format/releases/download/v$formatter_version/google-java-format-$formatter_version-all-deps.jar"
            chmod 755 google-java-format-$formatter_version-all-deps.jar
        fi
        cd ..

        java \
        --add-exports jdk.compiler/com.sun.tools.javac.api=ALL-UNNAMED \
        --add-exports jdk.compiler/com.sun.tools.javac.file=ALL-UNNAMED \
        --add-exports jdk.compiler/com.sun.tools.javac.parser=ALL-UNNAMED \
        --add-exports jdk.compiler/com.sun.tools.javac.tree=ALL-UNNAMED \
        --add-exports jdk.compiler/com.sun.tools.javac.util=ALL-UNNAMED \
        -jar .cache/google-java-format-$formatter_version-all-deps.jar --replace $2

        git add -u
    fi

fi

