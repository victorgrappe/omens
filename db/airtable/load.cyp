MATCH (n) DETACH DELETE n;

CALL apoc.schema.assert({},{},true) YIELD label, key RETURN *;

LOAD CSV WITH HEADERS FROM 'file:///airtable/dot.csv' AS row
CREATE (n:Dot {
  index:    toInteger(row.Index),
  name:     row.Name,
  class:    toInteger(split(row.Class, ".")[0]),
  tag:      [tag IN split(row.Tag, ",") | toInteger(split(tag, ".")[0]) ]
});

CREATE INDEX ON :Dot(index);

MATCH (c:Dot),(p:Dot)
WHERE c.class = p.index
CREATE (c)-[:CLASS]->(p);

MATCH (n) RETURN n;
