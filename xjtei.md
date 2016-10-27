# The XJ-TEI format

This document describe the JSON schema that is used to describe entries from
the nb+nn dictionary.  The format is inspired by [TEI Dictionary
XML](http://www.tei-c.org/release/doc/tei-p5-doc/en/html/DI.html).

The dictionary is a collection of _entries_ that have the following structure:

    {
        "id": 99999,
        "lang": "nn",
        "lemmas": ["foo"],
        "pos": "v",
        "pos2": "v1",
        "forms": [["fooe", "fooer", "fooet", "fooet"]],
        "etym": {
            "langs": [
                {
                    "lang": "latin",
                    "intro": "...",
                    "text": "..."
                }
            ],
            "cits": [
                {
                    "quote": "..."
                }
            ]
        },
        "senses": [
            {
                "n": "1",
                "defs": [
                    {
                        "def": "..."
                    }
                ],
                "cits": [
                    {
                        "quote": "...",
                        "usg": "..."
                    },
                ],
                "sub-defs": [
                    {
                        "def": "..."
                    }
                ],
                "sub-cits": [
                    {
                        "quote": "...",
                        "usg": "..."
                    },
                ],
            }
        ],
        "links": [
            {
                "rel": "compare",
                "target": 99901,
                "text": "..."
            },
            {
                "rel": "related",
                "target": 99904,
                "text": "...",
                "intro": "..."
            }
        ]
    }

Description of the elements of the array:

* _id_ numeric identification of this entry.

* _lang_ is the [ISO
  639-1 code](https://en.wikipedia.org/wiki/ISO_639-1) for the
  language the described word belongs to.  The descriptions follow the
  language.  The code is `nn` for Nynorsk and `nb` for Bokmål.

* _lemmas_  The base form of the word.  Note that the same lemma kan be used
  for different entries and a that an entry can be indexed by
  multiple lemmas (when there are multiple ways to write the same word).  Ref
  [wikipedia](https://en.wikipedia.org/wiki/Lemma_(morphology)).  The field is
  an array of at least one element.  The common case is that there is only one
  lemma for each entry.

* _pos_ is the word class the word belongs to.  It's a string like 'v=verb',
  'n=noun', 'a=adjective', 'av=adverb',...

* _pos2_ the the expanded word class code.  Given this code it's
  possible to algorithmically derive the forms from the _lemma_.  It's a
  string like 'n1', 'n2', 'v1', 'v2', 'm1'

* _forms_ lists how this word is written in its different forms.  The
  interpretation of these lists depend on the _pos_.  For instance for _nouns_
  the inner array consist of 4 elements (singular/plural × ubestemt/bestemt
  form).

* _etym_ describes where where the word came from. Ref [wikipedia](https://en.wikipedia.org/wiki/Etymology)

* _etym.langs_ describe the origins of the word from other languages

* _etym.langs[].lang_ language name (not ISO 631-1 this time)

* _etym.cits_ describes the origins of the word from literature

* _senses_ describes the meaning of the word and and examples of use.  These
  descriptions are grouped together.

* _senses[].n_  This is the label for this group of sense statements.  Can be supressed when there is only one.

* _senses[].defs_  Array containing definitions.  Each definition is an object with the attribute _def_ containing the text of the definition.

* _senses[].cits_  Array containing examples of use.  Each example of use is an object with the attributes _quote_ and _usg_.

* _senses[].sub-defs_  Array containing subordinate definitions in the same form as for _defs_.

* _senses[].sub-cits_ Array containing subordinate examples of use in the same form as for _cits_.

* _links_ is a list of references to other relevant entries.  The _rel_
  attribute encodes how this entry relates.

The following attributes repeats at various locations in the structure:


* _intro_ is a short unescaped text string that makes sense to inline in front of a link or the main text

* _text_ is a short HTML fragment (escaped). It's text with `<span>...</span>` elements.
The span elements can have the _class_ attribute set to one of the following values: "wordform",...

* _def_ is a text string (unescaped)

* _quote_ is a text string (unescaped)

* _usg_ is a text string (unescaped)
