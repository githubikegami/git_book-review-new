class AddBookreviewsIdToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :bookreview_id, :integer
  end
end
