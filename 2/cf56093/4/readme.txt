На представленном графике мы видем три кривые:

Кривая зелёного цвета - "cpu_usage_via_stat" - представляет отображение метрики загрузки ЦП с использованием ежисекундного анализа файла /proc/stat
Кривая жёлтого цвета - "cpu_usage" - метрика загрузки ЦП c использованием скрипта python и библиотеки psutil, так же с секундным интервалом.
Кривая голубого цвета - "D" - представляет собой метрику загрузки ЦП с использованием агента telegraf, с математическим преобразованием (100% - cpu_usage_idle.cpu-total), то есть, сто процентов минус общий простой в процентах всех ядер в системе.

Как видно из графика, все три кривые показывают выраженную положительную корреляцию, при том, жёлтая и зелёная кривая коррелируют между собой в значительно большей степени, чем они же с голубой. Высокая степень корреляции жёлтой и зелёной кривых объясняется тем, что для сбора метрики они используют практически один и тот же алгоритм измерения процессорного вресени за одну секунду, но разными способами. Незначительные расхождения можно объяснить тем, что при сборе метрики при помощи скрипта python незначительная часть процессорного времени тратится на инициализацию интерпритатора, что приводит к расхождению.

Согласно исходным кодам модуля imputs.cpu (https://github.com/influxdata/telegraf/blob/master/plugins/inputs/cpu/cpu.go) агента сбора метрик telegraf, сбор метрики usage_idle производится примерно таким же образом:

***
44: total := totalCPUTime(cts)
...
77: lastTotal := totalCPUTime(lastCts)
78: lastActive := activeCPUTime(lastCts)
79: totalDelta := total - lastTotal
...

93: "usage_idle":       100 * (cts.Idle - lastCts.Idle) / totalDelta,
...
***

Однако сам сбор сведений происходит с большим интервалом (согласно настроек агента, что в нашем случае - 10 секунд), в то время как реализованные скрипты сборки метрик загрузки запускаются каждые 10 секунд и предоставляют сведения о нагрузке лишь за последние 10 секунд, что и приводит к расхожлению в значениях при сохранении общей корреляционной картины. 

При таком подходе, более репрезентативным и корректным будет полагаться на данные, предоставляемые с помощью встроенного модуля агента telegraf.
