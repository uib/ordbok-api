# Dictionary SQLite database format

This document describes the SQLite export format of the "Bokmålsordboka og
Nynorskordboka" dictionary.  This is a database file containing a collection of
dictionary entries and supporting indexes.

The supporting tables should make it easy to locate entries by searching for
words in various forms.  The `headword` and `inflection` views/tables can be
deleted without loosing information, as this information can also be extracted
from the `entry.entry` structure.

All text strings in the database use the UTF-8 encoding.

The following pragma declares this version of the database:

* `pragma application_id = 0x6e626e6e`
* `pragma user_version = 1`

Non-backwards compatible revisions of this specification will increment the `user_version`.
An application should not try to load data when `user_version` is higher than what it was
developed for.

## Tables

The api views are based on two set of tables, one set for Nynorsk and one set for Bokmål  
Table names are post-fixed with: 0=`nb`,1=`nn`  
It is recommended to use the tables directly for better performance  

## Views

The column `lang` is created by the views  

### entry

col       |type|desc
----------|----|---------
id        |unique int| entry identifier
entry     |json| object representing one dictionary article

### headword

col       |type|desc
----------|----|-----
lang      |text| 'nb': 'Bokmål','nn': 'Nynorsk'
orth      |unique text|spelling of the headword
t         |text|type
cnt       |int |length of orth
entries   |text|list of entries separated with commas


#### Ordbanken - Ordboka
Orbanken contains the basic words of Norwegian  
Some words and idioms are added in ordboka e.g `finne på` and `direkten`  
In most cases norwegianified versions of words are present in ordboka, e.g. `kafe` and `kafè`  
Missing norwegianified/lowercase versions of words are generated after extraction
from the source database e.g `señora` -> `senora` and `NRK` -> `nrk`


#### headword type

type      |desc
----------|---------
B         |Base words from ordbanken with entries in ordboka
U         |Base words from ordbanken without entries in ordboka - undefined words
D         |Dummy - lowercase/transformed versions of headwords not already defined
I         |Ididoms and expressions added in ordboka


### inflection

col       |type|desc
----------|---------
lang      |text|'nb': 'Bokmål','nn': 'Nynorsk'
orth      |uniquq text|inflected forms of headword
cnt       |int|length of orth
headwords |text|list of headwords separated with `|`

#### examples
    lang='nb',orth='vakt',cnt=4,headwords='vak|vake|vakte|vekke'
    lang='nb',orth='gikk',cnt=4,headwords='gå'
