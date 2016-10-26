# The XJ-TEI format

This document describe the JSON schema that is used to describe entries from
the nb+nn dictionary.  The format is inspired by [TEI Dictionary
XML](http://www.tei-c.org/release/doc/tei-p5-doc/en/html/DI.html).

The dictionary is a collection of _entries_ that have the following form:

    {
        "id": 99999,
        "lang": "nn",
        "lemmas": ["foo"],
        "pos": "verb",
        "forms": [["fooe", "fooer", "fooet", "fooet"]],
        "pos2": "V1",
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
                "label": "1",
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

* _id_ numeric identification of this word article.

* _lang_ is the [ISO
  639-1 code](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) for the
  language the described word belongs to.  The descriptions follow the
  language.  The code is 'nn' for Nynorsk and 'nb' for Bokmål.

* _lemmas_  The base form of the word.  Note that the same lemma kan be used
  for different word articles and a single word can be represented with
  multiple lemmas (when there are multiple ways to write the same word).  Ref
  [wikipedia](https://en.wikipedia.org/wiki/Lemma_(morphology)).  The field is
  an array of at least one element.  The common case is that there is only one
  lemma for each word article.

* _pos_ is the word class the word belongs to.  It's a string like 'verb',
  'noun', 'adjective', 'adverb',...

* _forms_ lists how this word is written in its different forms.  The
  interpretation of these lists depend on the _type_.  For instance for _nouns_
  the inner array consist of 4 elements (singular/plural × ubestemt/bestemt
  form).  The labels to use can be obtained from the
  `/dictionary/form-labels` API (described below).

* _pos2_ is a code like "V1", "F1" that governs how the forms are generated.

* _etym_ describes where where the word came from. Ref [wikipedia](https://en.wikipedia.org/wiki/Etymology)

* _senses_ describes the meaning of the word.  Definitions are grouped together.

* _links_ is a list of references to other relevant word articles.  The _rel_
  attribute encodes how this article relates.

The following attributes repeats at various locations in the structure:

* _intro_ is a short text string that makes sense to inline in front of a link or the main text

* _text_ is a short HTML fragment (escaped). It's text with `<span>...</span>` elements.
The span elements can have the _class_ attribute set to one of the following values: "wordform",...

* _minor_ is a boolean element that occurs for _definitions/statements_.  It default to _false_.
If set it indicates that this is an subordinate definition.

* _quote_ is a text string (unescaped)

* _caption_ is a text string (unescaped)
