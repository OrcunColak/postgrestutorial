# Supported Languages

See https://lazypro.medium.com/postgresql-full-text-search-in-a-nutshell-1efc744267d3
As of today (PostgreSQL 16), there are only 29 in total.

```
# SELECT cfgname FROM pg_ts_config;
cfgname
------------
simple
arabic
armenian
basque
catalan
danish
dutch
english
finnish
french
german
greek
hindi
hungarian
indonesian
irish
italian
lithuanian
nepali
norwegian
portuguese
romanian
russian
serbian
spanish
swedish
tamil
turkish
yiddish
(29 rows)
```

# CJK (Chinese, Japanese,Korean) Languages

There is no ability to handle double-byte characters.

For languages without built-in support, they can be handled by extensions. Take Chinese as an example, pg_jieba is a
widely used extension.

After installing the extension, we just need to modify the catalog in PostgreSQL.

```
CREATE EXTENSION pg_jieba;
UPDATE blog_posts SET tsv = to_tsvector('jieba', title || ' ' || body);
```

# Create  tsvector Column

CREATE a column with tsvector type

```
ALTER TABLE blog_posts ADD COLUMN tsv tsvector;
UPDATE blog_posts SET tsv = to_tsvector('english', title || ' ' || body);
```

# Index

the tsv column needs to be indexed with a GIN type index, otherwise the performance will be poor.

```
CREATE INDEX idx_fts ON blog_posts USING gin(tsv);
```

# Query

```
-- Show rank column too
SELECT id, title, body, author, created_at, updated_at, published,
ts_rank(tsv, to_tsquery('english', 'excited | trends')) AS rank
FROM blog_posts
WHERE tsv @@ to_tsquery('english', 'excited | trends')
ORDER BY rank DESC;
```