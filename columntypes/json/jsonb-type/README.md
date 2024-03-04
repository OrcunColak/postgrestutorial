**Index Types**  
From  
https://medium.com/@adamf_64691/how-to-avoid-performance-bottlenecks-when-using-jsonb-in-postgresql-649282b6a7c6

For JSONB column, you have a few options for indexing:

1. GIN/GIST index: This allows you to index the contents of JSONB documents and perform fast searches and queries on
   that data.
2. B-tree index: A B-tree index is a general-purpose index that can be used with any data type, including JSONB. B-tree
   indexes can be a good choice if you need to index JSONB data and perform a wide range of search operations on it.
3. Hash index: Hash indexes are fast for searching for exact matches, but they do not support range queries or sorting.
   They are not a good choice for indexing JSONB data.

**GIN vs GIST Index**  
There are two special indexes for complex data types like arrays, JSON, and hstore (key-value pairs).  
These are GiST (Generalized Search Tree) and GIN (Generalized Inverted Index).  
They are similar in this sense that both of them improve the performance of data search and data retrieval.

1. **Search capabilities**: GiST indexes are designed to support a wide range of search operations, including full-text search, spatial search, and more. GIN indexes, on the other hand, are primarily designed to support fast search and retrieval of specific values within complex data types.
2. **Index size**: GiST indexes can be larger than GIN indexes because they store more detailed information about the data they are indexing.
3. **Performance**: In general, GIN indexes are faster than GiST indexes for searching for specific values within complex data types, but GiST indexes may be faster for certain types of searches such as full-text search or spatial search.