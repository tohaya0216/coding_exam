class Tag < ApplicationRecord
  has_many :recipe, through: :recipe_tag
  has_many :recipe_tag
end
