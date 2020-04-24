require "csv"

products_csv = CSV.readlines("db/users.csv")
products_csv.each do |row|
  Product.create(email: row[1], encrypted_password: row[2], created_at: row[5], updated_at: row[6],nickname: row[7],text: row[8])
end