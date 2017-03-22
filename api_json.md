# usd json object

### plural
Names that ends with "s" are lists


### abbreviations
abb|full
--------|----
cit     |citation
context |.
def     |definition
eid     |entry id
etym    |etymology
form    |inflected form
gram    |grammatical information
headword|.
intro   |.
lang    |language
n       |sense number
phon    |phonetics
pos     |part of speech - main
posl    |part of speech - list of subcategories
quote   |quotation
ref     |reference
samans  |samansetningsrekker
sense   |.
text    |.
usg     |usage

### sense def prefix
mm-,ms-,sm-,

c1 |c2
---|----
m=main entry |m=main definition       
s=sub entry  |s=sub definition  

### example - løp
<pre>
etym.samans.0.text            i sammensetninger  som gjelder ulike idretter:
etym.samans.1.ref             <a href="{url}&sok=kvalifiseringsløp#329850">kvalifiseringsløp</a>
</pre>

### example - filere
<pre>
senses.2.defs.0.mm-context    mus.</pre>
</pre>

### example - artium
<pre>
etym.phons.0.phon             artsium
</pre>

### complete example - stas
<pre>
norsk-lang                    nb
eid                           567290
grams
grams.0.headword              stas
grams.0.pos                   substantiv
grams.0.posl                  m1
grams.0.forms
grams.0.forms.0.th            pos|ent be|fl ub|fl be
grams.0.forms.1.td            m1|stasen|staser|stasene
grams.0.forms.2.te            1
etym.langs
etym.langs.0.intro            av
etym.langs.0.lang             middelalderlatin
etym.langs.0.text             <ordform>statio</ordform> 'stans under prosesjon' og genitiv  av
etym.langs.1.intro            eldre
etym.langs.1.lang             dansk
etym.langs.1.text             <ordform>stat</ordform> 'stas, prakt'
etym.refs
etym.refs.0.intro             beslektet  med
etym.refs.0.ref               <a href="{url}&sok=stasjon#567320">stasjon</a>
etym.refs.0.text
etym.cits
etym.cits.0.text              trolig  sammenfall av lavtysk  <ordform>stacie</ordform> '(kirkelig) prosesjon, prakt'
senses
senses.0.n                    1
senses.0.defs
senses.0.defs.0.mm-def        <a href="{url}&sok=pynt#469860">pynt(II)</a>, <a href="{url}&sok=prakt#458750">prakt</a>
senses.0.defs.1.mm-quote      være kledd i sin fineste <ordform fk="s-">stas</ordform>
senses.0.defs.2.sm-def        alt sammen
senses.0.defs.3.sm-def        (gå, sitte) pyntet uten å gjøre nyttig arbeid, ha gode dager
senses.0.defs.4.sm-def        til pynt
senses.1.n                    2
senses.1.defs
senses.1.defs.0.mm-def        <a href="{url}&sok=moro#391220">moro(I)</a>, festlighet
senses.1.defs.1.mm-quote      barna synes det er <ordform fk="s-">stas</ordform> med julen
senses.1.defs.2.ms-def        <a href="{url}&sok=glede#201980">glede(I)</a>
senses.1.defs.3.ms-quote      gjøre <ordform fk="s-">stas</ordform> på en
senses.1.defs.3.ms-usg        vise stor oppmerksomhet, hylle
senses.1.defs.4.ms-quote      det ble stor <ordform fk="s-">stas</ordform> da de traff hverandre igjen
</pre>








