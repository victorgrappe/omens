// Load records
LOAD CSV WITH HEADERS FROM 'file:///northwind/products.csv' AS row
CREATE (n:Product)
SET n = row,
n.unitPrice = toFloat(row.unitPrice),
n.unitsInStock = toInteger(row.unitsInStock), n.unitsOnOrder = toInteger(row.unitsOnOrder),
n.reorderLevel = toInteger(row.reorderLevel), n.discontinued = (row.discontinued <> '0');

LOAD CSV WITH HEADERS FROM 'file:///northwind/categories.csv' AS row
CREATE (n:Category)
SET n = row;

LOAD CSV WITH HEADERS FROM 'file:///northwind/suppliers.csv' AS row
CREATE (n:Supplier)
SET n = row;


// Create indexes
CREATE INDEX ON :Product(productID);

CREATE INDEX ON :Category(categoryID);

CREATE INDEX ON :Supplier(supplierID);


// Create data relationships
MATCH (p:Product),(c:Category)
WHERE p.categoryID = c.categoryID
CREATE (p)-[:PART_OF]->(c);

MATCH (p:Product),(s:Supplier)
WHERE p.supplierID = s.supplierID
CREATE (s)-[:SUPPLIES]->(p);


// Query using patterns
MATCH (s:Supplier)-->(:Product)-->(c:Category)
RETURN s.companyName AS Company, collect(DISTINCT c.categoryName) AS Categories;

MATCH (c:Category {categoryName:'Produce'})<--(:Product)<--(s:Supplier)
RETURN DISTINCT s.companyName AS ProduceSuppliers;


// Load and index records
LOAD CSV WITH HEADERS FROM 'file:///northwind/customers.csv' AS row
CREATE (n:Customer)
SET n = row;

LOAD CSV WITH HEADERS FROM 'file:///northwind/orders.csv' AS row
CREATE (n:Order)
SET n = row;

CREATE INDEX ON :Customer(customerID);

CREATE INDEX ON :Order(orderID);


// Create data relationships
MATCH (c:Customer),(o:Order)
WHERE c.customerID = o.customerID
CREATE (c)-[:PURCHASED]->(o);


// Load and index records
LOAD CSV WITH HEADERS FROM 'file:///northwind/order-details.csv' AS row
MATCH (p:Product), (o:Order)
WHERE p.productID = row.productID AND o.orderID = row.orderID
CREATE (o)-[details:ORDERS]->(p)
SET details = row,
details.quantity = toInteger(row.quantity);


// Query using patterns
MATCH (cust:Customer)-[:PURCHASED]->(:Order)-[o:ORDERS]->(p:Product),
  (p)-[:PART_OF]->(c:Category {categoryName:'Produce'})
RETURN DISTINCT cust.contactName AS CustomerName, sum(o.quantity) AS TotalProductsPurchased;
