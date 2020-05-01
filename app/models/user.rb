class User < ApplicationRecord
  validates :email,:password,:password_confirmation,:nickname,:image, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookreviews
  has_many :comments
  
  has_one_attached :image
end
