See https://medium.com/@adamf_64691/postgres-can-do-that-no-surprise-postgres-is-everywhere-04de975f5b13

Even though Postgres supports FTS natively, other extensions do the job even better. For example, pg_search, a component
of ParadeDB, can be 20 times faster than the tsvector solution. This extension is built on the Okapi BM25 algorithm,
widely used by search engines to assess the relevance of documents. It utilizes the Inverse Document Frequency (IDF)
formula, which applies probabilistic methods to identify matches.

pg_search is:

- Built natively with Postgres and with no dependencies on external search solutions
- Uses a solution similar to Apache Lucene
- Supports fuzzy search, aggregations, relevance tuning, and highlighting
- Uses the same algorithm as Elasticsearch
- Doesn’t require manual reindexing

This makes Postgres very competitive with Elasticsearch.