class Comment < ApplicationRecord
    belongs_to :bookreview, dependent: :destroy
    belongs_to :user, dependent: :destroy
end
