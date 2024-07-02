#!/bin/bash

# Set the JAVA_HOME to JDK 8 directory
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

# Ensure JAVA_HOME is correct
if [ ! -d "$JAVA_HOME" ]; then
    echo "Error: JAVA_HOME is not correctly set. Please ensure JDK 8 is installed and JAVA_HOME is set correctly."
    exit 1
fi

# Set the project home directory
JX_HOME=$(pwd)/../..

# Set the path to rt.jar
RT_JAR_PATH="$JAVA_HOME/jre/lib/rt.jar"

# Check if rt.jar exists
if [ ! -f "$RT_JAR_PATH" ]; then
    echo "Error: rt.jar not found at $RT_JAR_PATH"
    exit 1
fi

# Compile the Java sources
javac -source 8 -target 8 -d ./bin -cp .:$JX_HOME/libs/jxclasses.jar:$JX_HOME/external_libs/json-20160212.jar -bootclasspath $RT_JAR_PATH @sources.txt

# Check if the compilation was successful
if [ $? -eq 0 ]; then
    echo "Compilation successful"
else
    echo "Compilation failed"
    exit 1
fi

