class Recipe < ApplicationRecord
   has_many :recipe_processes, dependent: :destroy
end
