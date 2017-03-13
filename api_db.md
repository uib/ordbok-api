#API VIEWS

##Entry
col       |desc
----------|---------
id        |numeric id 
entry     |json object representing one entry

##Headword
col       |desc
--        |--
lang      |'nb': 'Bokmål','nn': 'Nynorsk'
orth      |headword
t         |type
cnt       |length of orth
entries   |list of entries separated with commas

###type:
'B' Base words from ordbanken with entries in ordboka
'U' Base words from ordbanken without entries in ordboka - undefined words
'D' Dummy - lowercase/transformed versions of headwords not already defined
'I' Ididoms and expressions added in ordboka

##Inflection
lang      'nb': 'Bokmål','nn': 'Nynorsk'
orth      inflected forms of headword
cnt       length of orth
headwords list of headwords separated with '|'

          example:
          lang='nb',orth='vakt',cnt=4,headwords='vak|vake|vakte|vekke'
          lang='nb',orth='gikk',cnt=4,headwords='gå'

#API TABLES
0='nb',1='nn'
