class Recipe < ApplicationRecord
    attachment :recipe_image
    has_many :comments
    belongs_to :user
    validates :title,:content,:recipe_image,presence: true
end
