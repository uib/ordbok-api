# Text values
### Abbreviations
abb  |description
-----|-----------
b    |bounded,bunden,bestemt
m    |maskulinum
f    |femininum
mf   |maskulinum/femininum
n    |neuter
s    |singular
plur |plural
nom  |nominative
inf  |infinitivus
pres |presens
pret |preteritum
supi |supinum
perf |perfektum
part |participium
imp  |imperativus
pos  |positive
comp |comparative
super|superlative
pp   |perfektum participium
obj  |objective

### Head strings
hid|0     |1       |2       |3       |4       |5      |6      |7     |8      |9        |10     |11       |12 |13 |14
---|---   |---     |---     |---     |---     |---    |---    |---   |---    |---      |---    |---      |---|---|---
10|inf    |pres    |inf pres|pret    |pp supi |pp n   |pp mf  |pp b  |pp plur|pres part|imp
11|inf    |inf     |pres    |inf pres|pret    |pp supi|pp n   |pp mf |pp f   |pp b     |pp plur|pres part|imp|imp|imp
12|inf    |pres    |pret    |supi    |imp
13|inf    |pres    |pret    |supi
14|s m    |s f     |s n     |s b     |plur
15|s m    |s f     |s n     |s b     |plur    |comp   |super  |super b
16|pos mf |pos plur|pos b   |pos n   |comp    |super  |super b
17|pos    |comp    |super
18|pos m  |pos f   |pos n   |pos b   |pos plur|comp   |super  |super b
19|s m    |s f     |s n     |plur
20|nom    |b       |plur    |plur b
21|nom    |b       |plur    |plur b
22|nom    |obj

### Head tids
hid|0     |1       |2       |3       |4       |5      |6      |7     |8      |9        |10     |11       |12 |13 |14
---|---   |---     |---     |---     |---     |---    |---    |---   |---    |---      |---    |---      |---|---|---
10|18|19|18,19|20|28,21|28,14|28,13|28,10|28,16|19,23|24
11|18|18|19|18,19|20|28,21|28,14|28,13|28,12|28,10|28,16|19,23|24|24|24
12|18|19|20|21|24
13|18|19|20|21
14|15,11|15,12|15,14|15,10|16
15|15,11|15,12|15,14|15,10|16|26|27|27,10
16|25,13|25,16|25,10|25,14|26|27|27,10
17|25|26|27
18|25,11|25,12|25,14|25,10|25,16|26|27|27,10
19|15,11|15,12|15,14|16
20|17|10|16|16,10
21|17|10|16|16,10
22|17|29

### Tids
tid|value
---|-----
10|b
11|m
12|f
13|mf
14|n
15|s
16|plur
17|nom
18|inf
19|pres
20|pret
21|supi
22|perf
23|part
24|imp
25|pos
26|comp
27|super
28|pp
29|obj
100|verb, normal
111|verb, normal
120|verb, s-verb
131|verb, st-verb
140|determinativ, <adj>
151|determinativ, <adj>
160|adjektiv
161|adjektiv
170|adjektiv, adverbtype
171|adjektiv, adverbtype
180|adjektiv, ulik m/f
181|adjektiv, ulik m/f
190|determinativ
191|determinativ
200|substantiv
201|substantiv
211|substantiv, sv hokj
220|pronomen, normal
221|pronomen, normal
230|i sammensetting
240|verb, ubøy
251|i samansetting
261|infinitivsmerke
270|adverb
271|adverb
280|determinativ, enkel
281|determinativ, enkel
290|forkorting
291|forkorting
300|interjeksjon
301|interjeksjon
310|konjunksjon
311|konjunksjon
320|prefiks
321|prefiks
330|preposisjon
331|preposisjon
340|pronomen, enkel
341|pronomen, enkel
350|subjunksjon
351|subjunksjon
360|substantiv, ubøy
361|substantiv, ubøy
370|symbol
371|symbol