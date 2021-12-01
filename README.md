# Procesadores de Lenguajes

## Bloque 1: Análisis Léxico

***Ejercicios jflex:*** [JFLEX](https://github.com/Hidden-Process/ProLeng/tree/main/jflex)

## Bloque 2 y 3: Análisis Sintáctico y Semántico

***Ejercicios CUP:*** [CUP](https://github.com/Hidden-Process/ProLeng/tree/main/cup)

Instrucciones para compilar fichero .lex

jflex nomFich

Instrucciones para compilar fichero cup

cup nomFich

Instrucciones para compilar y ejecutar los ficheros generados por jflex y cup:

javac -cp .:java-cup-11b-runtime.jar nomFich.java

java -cp .:java-cup-11b-runtime.jar nomFich input.txt


