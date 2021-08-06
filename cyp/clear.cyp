MATCH (n) DETACH DELETE n;
CALL apoc.schema.assert({},{},true) YIELD label, key RETURN *;
