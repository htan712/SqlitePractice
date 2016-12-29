Database Schema:

apps: id: Integer, name: Text, price: Integer, downloads: Integer, category: Text


# Remove duplicates

"SELECT DISTINCT category FROM apps"

App.select(:category).distinct

# filter records using inequalities, pattern matching, ranges, and boolean logic

top_paid = sql.performQuery("SELECT * FROM apps WHERE price > 5 ORDER BY download DESC")

App.where(price > 5).order(download: :desc)

# sort records in a particular order

most_downloads = sql.performQuery("SELECT * FROM apps ORDER BY download DESC")

App.order(download: :desc)

# limit the number of records returned

top_ten_downlods = sql.performQuery("SELECT * FROM apps ORDER BY download DESC LIMIT 10")

App.order(download: :desc).limit(10)

# group records into sections

price_and_downloads = sql.performQuery("SELECT price, downloads FROM apps WHERE downloads > 50000 GROUP BY price")

App.select("name, price, downloads").where(downloads > 50000).group("price")


# perform calculations using aggregate functions

avg_downloads = sql.performQuery("SELECT price, ROUND(AVG(download), 2) FROM apps GROUP BY price")

App.select("price, ROUND(AVG(download)), 2").group("price")

# join tables using cross join, inner join, and outer join

Database Schema:

movies: id: Integer, name: Text
actors: id: Integer, name: Text, movie_id: Text

cross_join = sql.performQuery("SELECT actors.name, movies.name FROM movies, actors")

Actors.select("actors.name, movies.name").joins("FULL JOIN movies on actors.movie_id = movies.id")

inner_join = sql.performQuery("SELECT actors.name as ActorName, movies.name as MovieName FROM movies JOIN actors ON actors.movie_id = movies.id")

Actors.select("actors.name as ActorName, movies.name as MovieName").joins("INNER JOIN movies ON actors.movie_id = movies.id")

outer_join = sql.performQuery("SELECT actors.name as ActorName, movies.name as MovieName FROM movies LEFT JOIN actors ON actors.movie_id = movies.id")

Actors.select("actors.name as ActorName, movies.name as MovieName")joins("LEFT JOIN movies ON actors.movie_id = movies.id")




