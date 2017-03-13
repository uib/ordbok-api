#API TABLES
The api views are based on two set of tables, one set for Nynorsk and one set for Bokmål  
Table names are post-fixed with: 0=`nb`,1=`nn`  
It is recommended to use the tables directly for better performance  

#API VIEWS
The column lang is created by the views  

##entry
col       |desc
----------|---------
id        |numeric id 
entry     |json object representing one entry

##headword
col       |desc
----------|---------
lang      |'nb': 'Bokmål','nn': 'Nynorsk'
orth      |headword
t         |type
cnt       |length of orth
entries   |list of entries separated with commas


###Ordbanken - Ordboka
Orbanken contains the basic words of Norwegian  
Some words and idioms are added in ordboka e.g `finne på` and `direkten`  
In most cases norwegianified versions of words are present in ordboka, e.g. `kafe` and `kafè`  
Missing norwegianified/lowercase versions of words are generated after extraction
from the source database e.g `señora` -> `senora` and `NRK` -> `nrk`


###headword type
type      |desc
----------|---------
B         |Base words from ordbanken with entries in ordboka
U         |Base words from ordbanken without entries in ordboka - undefined words
D         |Dummy - lowercase/transformed versions of headwords not already defined
I         |Ididoms and expressions added in ordboka

##inflection
col       |desc
----------|---------
lang      |'nb': 'Bokmål','nn': 'Nynorsk'
orth      |inflected forms of headword
cnt       |length of orth
headwords |list of headwords separated with `|`

###row examples
    lang='nb',orth='vakt',cnt=4,headwords='vak|vake|vakte|vekke'
    lang='nb',orth='gikk',cnt=4,headwords='gå'
