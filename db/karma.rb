


inserts = []
User.size.times do
  inserts.push "JOINS BY (karma_points) GROUP BY (users.id) ORDER BY (SUM(karma_points.value) DESC"
end
sql = "INSERT INTO users ('total_karma') VALUES #{inserts}"
