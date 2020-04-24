require "csv"

products_csv = CSV.readlines("db/users.csv")
products_csv.each do |row|
  Product.create(title: row[1], image_url: row[2], director: row[5], detail: row[6], open_date: row[7])
end