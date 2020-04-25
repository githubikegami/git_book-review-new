require "csv"

products_csv = CSV.readlines(Rails.root + "db/bookreviews.csv")
products_csv.each do |row|
  Bookreview.create(title: row[1], description: row[2], price: row[3], publisher: row[4],release_date: row[5],image_url: row[6],author: row[7],created_at: row[8],updated_at: row[9])
end


