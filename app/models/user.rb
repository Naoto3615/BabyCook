class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable

attachment :profile_image
has_many :recipes
has_many :comments,dependent: :destroy
validates :email,:nickname,:encrypted_password,:profile,presence: true
end

