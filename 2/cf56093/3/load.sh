#!/bin/bash

#Этот простой скрипт нагружает CPU системы путём запуска множественных экземпляров утилиты dd, выполняющей бесконечное копирования из псевдоустройства /dev/urandom в /dev/zero, что приводит к растрате системных ресурсов на генерацию случайных данных.
#Запускайте как "./load.sh #", где # - количество экземпляров dd. Без ограничений на пропускную способность, dd займёт 100% одного ядра процессора.
#Например, если у вас 10 ядер, то запусе "./load.sh 6" приведёт к дополнительной загрузки системы примерно на 60% от её ресурсов

for (( i=1; i <= $1; i++ ))
do
	dd if=/dev/urandom of=/dev/zero &
	pid[$i]=$!
	echo Starting endless dd with $! pid...
done

read -p "All dd's is started. Press enter to terminate them..." dummy

for i in "${pid[@]}";
do
	echo "Killing dd with pid $i..."
	kill -9 $i
 done
