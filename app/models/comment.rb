class Comment < ApplicationRecord
    belongs_to :bookreview
    belongs_to :user
end
