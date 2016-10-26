# SQLite API database

## Database schema

### `entry` (artikkel)

Field|Type|Comment
-----|----|---------
`id` | int pk
`lang` | enum('nb', 'nn') | Bokmål or Nynorsk
`pos_id`| fk |
`tei` | xml
`xjtei` | json

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

