Omens
=====

Run
---

### airtable
```sh
sh ./db/airtable/load.sh
sh ./db/airtable/extract.sh
```
### dot
```sh
sh ./db/dot/load.sh
```
### movie
```sh
sh ./db/movie/load.sh
```
### ned
```sh
sh ./db/ned/extract.sh
```
### northwind
```sh
sh ./db/northwind/load.sh
```


Setup
-----

### APOC
[github - neo4j-apoc-procedures](https://github.com/neo4j-contrib/neo4j-apoc-procedures/releases/4.1.0.0)

```
# Old
dbms.security.procedures.unrestricted=jwt.security.*

# New
dbms.security.procedures.unrestricted=algo.*,apoc.*
```