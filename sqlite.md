# Dictionary SQLite database format

This document describes the SQLite export format.  This is a database file
containing a collection of dictionary entries and supporting indexes and
tables.

The supporting tables should make it easy to locate articles by searching for
words in various forms.  The `lemma`, `form` and `searchtext` tables can be
deleted if not useful without loosing information as the information can also
be obtained from the `entry.xjtei` data.

## Database schema

### `entry` (artikkel)

Field|Type|Comment
-----|----|---------
`id` | int pk
`lang` | enum('nb', 'nn') | Bokmål or Nynorsk
`pos_id`| fk |
`tei` | xml null | The dictionary entry in TEI format
`xjtei` | json | The dictionary entry in [XJ-TEI format](xjtei.md)

### `lemma`

Field|Type|Comment
-----|----|---------
`id` | int pk
`orth`| varchar |
`entry_id`|fk |

### `pos`

Field|Type|Comment
-----|----|---------
`id` | enum('v', 'n',...) |
`name`| varchar |
`lang`| enum('nb', 'nn')

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

Field|Type|Comment
-----|----|---------
`entry_id` | pk fk
`text` | text

