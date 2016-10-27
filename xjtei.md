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

Description of the elements of the entry object:

* `id` numeric identification of this entry.

* `lang` is the [ISO
  639-1 code](https://en.wikipedia.org/wiki/ISO_639-1) for the
  language the described word belongs to.  The descriptions follow the
  language.  The code is `nn` for Nynorsk and `nb` for Bokmål.

* `lemmas`  The base form of the word.  Note that the same lemma kan be used
  for different entries and that an entry can be indexed by
  multiple lemmas (when there are multiple ways to write the same word).  Ref
  [wikipedia](https://en.wikipedia.org/wiki/Lemma_(morphology)).  The field is
  an array of at least one element.  The common case is that there is only one
  lemma for each entry.

* `pos` is the word class the word belongs to.  It's a string like 'v=verb',
  'n=noun', 'a=adjective', 'av=adverb',...

* `pos2` the the expanded word class code.  Given this code it's
  possible to algorithmically derive the forms from the _lemma`.  It's a
  string like 'n1', 'n2', 'v1', 'v2', 'm1'

* `forms` lists how this word is written in its different forms.  The
  interpretation of these lists depend on the `pos`.  For instance for _nouns_
  the inner array consist of 4 elements (singular/plural × ubestemt/bestemt
  form).

* `etym` describes where where the word came from. Ref [wikipedia](https://en.wikipedia.org/wiki/Etymology)

* `etym.langs` describe the origins of the word from other languages

* `etym.langs[].lang` language name (not ISO 631-1 this time)

* `etym.cits` describes the origins of the word from literature

* `senses` describes the meaning of the word and and examples of use.  These
  descriptions are grouped together.

* `senses[].n`  This is the label for this group of sense statements.  Can be supressed when there is only one.

* `senses[].defs`  Array containing definitions.  Each definition is an object with the attribute `def` containing the text of the definition.

* `senses[].cits`  Array containing examples of use.  Each example of use is an object with the attributes `quote` and `usg`.

* `senses[].sub-defs`  Array containing subordinate definitions in the same form as for `defs`.

* `senses[].sub-cits` Array containing subordinate examples of use in the same form as for `cits`.

* `links` is a list of references to other relevant entries.  The `rel`
  attribute encodes how this entry relates.

The following attributes repeats at various locations in the structure:


* `intro` is a short unescaped text string that makes sense to inline in front of a link or the main text

* `text` is a short HTML fragment (escaped). It's text with `<span>...</span>` elements.
The span elements can have the _class_ attribute set to one of the following values: "wordform",...

* `def` is a text string (unescaped)

* `quote` is a text string (unescaped)

* `usg` is a text string (unescaped)
