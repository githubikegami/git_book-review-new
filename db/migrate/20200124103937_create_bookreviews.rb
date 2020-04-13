class CreateBookreviews < ActiveRecord::Migration[5.2]
  def change
    create_table :bookreviews do |t|
      t.string :title
      t.text :description
      t.string :price
      t.string :publisher
      t.text :image_url
      t.string :release_date
      t.string :author
      t.timestamps null: true
    end
  end
end
