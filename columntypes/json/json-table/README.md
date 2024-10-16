See https://medium.com/@atarax/finally-json-table-is-here-postgres-17-a9b5245649bd

JSON_TABLE is an SQL/JSON function which queries JSON data and presents the results as a relational view, which can be
accessed as a regular SQL table. You can use JSON_TABLE inside the FROM clause of a SELECT, UPDATE, or DELETE and as
data source in a MERGE statement.

Taking JSON data as input, JSON_TABLE uses a JSON path expression to extract a part of the provided data to use as a row
pattern for the constructed view. Each SQL/JSON value given by the row pattern serves as source for a separate row in
the constructed view.

To split the row pattern into columns, JSON_TABLE provides the COLUMNS clause that defines the schema of the created
view. For each column, a separate JSON path expression can be specified to be evaluated against the row pattern to get
an SQL/JSON value that will become the value for the specified column in a given output row.