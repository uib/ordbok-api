#sqls used against api.db
##substitutions
symbol|desc
------|----
{mf} |0='nb',1='nn'
{ope}|’=’ or ‘like’  
?    |entered search  

NB: 'like' does not use the index, and will be slower  
use 'like' only if the user has entered wildchars  

##search headword
```sql
select entries from headword{mf} where orth {ope} ?
```  
If this results in one row, then **show entries**.  
If this results in more than one row, then **list alternatives**  
If no results:

##search inflection
```sql 
select headwords from inflection{mf} where orth {ope} ?
```  
If this results in one row with one headword, then **search headword**  
If this results on more than one row or more than one headword, then **list alternatives**  

##show entries
For each entry:  
```sql
select entry from entry{mf} where id=?
```

##list alternatives
```sql
select * from (select cnt,orth sew,orth hews from headword{mf} where orth {ope} ? order by cnt,orth limit 500)  
select * from (select cnt,orth sew,headwords hews from inflection{mf} where orth {ope} ? order by cnt,orth limit 500)
```


