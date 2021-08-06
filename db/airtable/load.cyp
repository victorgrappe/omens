MATCH (n) DETACH DELETE n;

CALL apoc.schema.assert({},{},true) YIELD label, key RETURN *;

LOAD CSV WITH HEADERS FROM 'file:///airtable/dot.csv' AS row
CREATE (a:Dot {
  index:    toInteger(row.Index),
  name:     row.Name
});

MATCH (n) RETURN n;
