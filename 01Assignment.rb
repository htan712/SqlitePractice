For a table of apps with columns of name, price, downloads

# Remove duplicates

prices = sql.performQuery("SELECT DISTINCT price FROM apps")

# filter records using inequalities, pattern matching, ranges, and boolean logic

top_paid = sql.performQuery("SELECT * FROM apps WHERE price > 5 ORDER BY download DESC")

# sort records in a particular order

most_downloads = sql.performQuery("SELECT * FROM apps ORDER BY download DESC")

# limit the number of records returned

top_ten_downlods = sql.performQuery("SELECT * FROM apps ORDER BY download DESC LIMIT 10")

# group records into sections

price_and_downloads = sql.performQuery("SELECT price, COUNT(*), downloads FROM apps WHERE downloads > 50000 GROUP BY price")

# perform calculations using aggregate functions

avg_downloads = sql.performQuery("SELECT price, ROUND(AVG(download), 2) FROM apps GROUP BY price")

# join tables using cross join, inner join, and outer join

Database Schema:

actors: id: Integer, name: Text
movies: id: Integer, name: Text, actor_id: Text

cross_join = sql.performQuery("SELECT movies.name, actors.name FROM movies, actors")

inner_join = sql.performQuery("SELECT * FROM movies JOIN actors ON movies.actor_id = actors.id")

outer_join = sql.performQuery("SELECT * FROM movies LEFT JOIN actors ON movies.actor_id = actors.id")