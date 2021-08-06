MATCH (n) DETACH DELETE n;

CALL apoc.schema.assert({},{},true) YIELD label, key RETURN *;

LOAD CSV WITH HEADERS FROM 'file:///airtable/dot.csv' AS row
CREATE (d:Dot {
  index:    toInteger(row.Index),
  name:     row.Name,
  class:    toInteger(split(row.Class, ".")[0]),
  tag:      [tag IN split(row.Tag, ",") | toInteger(split(tag, ".")[0]) ]
});

CREATE INDEX ON :Dot(index);

MATCH (child:Dot),(parent:Dot)
WHERE child.class = parent.index
CREATE (child)-[:CLASS]->(parent);

MATCH (dot:Dot),(tag:Dot)
WHERE tag.index IN dot.tag
CREATE (dot)-[:TAG]->(tag);

MATCH (n) RETURN n;
