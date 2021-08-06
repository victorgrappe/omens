MATCH (n) DETACH DELETE n;

LOAD CSV WITH HEADERS FROM "file:///dot/dot.csv" AS line
MERGE (a:Dot { id: line.Index })
   ON MATCH SET a.name = line.Name
   ON CREATE SET a.name = line.Name
FOREACH (ignoreMe in CASE WHEN exists(line.Class) THEN [1] ELSE [] END | MERGE (b:Dot { id: line.Class }) MERGE (a)-[:CLASS]->(b) );

MATCH (n) RETURN n;