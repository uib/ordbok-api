# Dictionary SQLite database format

This document describes the SQLite export format.  This is a database file
containing a collection of dictionary entries and supporting indexes and
tables.

The supporting tables should make it easy to locate articles by searching for
words in various forms.  The `lemma`, `form` and `searchtext` tables can be
deleted without loosing information, as this information can also
be obtained from the `entry.xjtei` data.

## Database schema

### `entry`

This represents a single directory entry.  This is an article describing a
single "word".  Note that the spelling of the lemma of an entry isn't unique.
There can be multiple entries for the same sequence of letters.

Field|Type|Comment
-----|----|---------
`id` | int pk | Every entry has a numeric key
`lang` | enum('nb', 'nn') | Bokmål or Nynorsk [ISO
  639-1 code](https://en.wikipedia.org/wiki/List_of_ISO_639-1_code)
`pos_id`| fk | What kind of word is this (verb, noun,...)
`tei` | xml null | The dictionary entry in TEI format
`xjtei` | json | The dictionary entry in [XJ-TEI format](xjtei.md)

### `lemma`

The base form of the word described by a dictionary entry.
Ref [wikipedia](https://en.wikipedia.org/wiki/Lemma_(morphology)).
A single article can have multiple lemmas, and the same `lemma.orth`
value can be used by multiple entries.

Field|Type|Comment
-----|----|---------
`id` | int pk | Each lemma has it's own key
`orth`| varchar | The spelling of the word
`entry_id`|fk | The corresponding entry

### `pos`

POS = Part of Speech

Field|Type|Comment
-----|----|---------
`id` | enum('v', 'n',...) | The class of word (v=verb, n=noun,...)
`name`| varchar | 'Verb', 'Substantiv', 'Adjektiv',...
`lang`| enum('nb', 'nn') | The language of `name`

### `gram`

Field|Type|Comment
-----|----|---------
`id` | id
`name`| varchar
`order`| int
`pos_id` | fk
`lang` | enum('nb', 'nn')

### `form` (fullform)

Field|Type|Comment
-----|----|---------
`lemma_id` | fk | Combined key
`gram_id` | fk | Combined key
`paradigm` | int | Combined key
`orth` | varchar | text

### `searchtext`

This is contains the unstructured text found in a dictionary entry.
It can be used to implement full text search for dictionary entries
that mention a specific word in its description.

Field|Type|Comment
-----|----|---------
`entry_id` | pk fk | The dictionary entry
`text` | text | Long string of words

