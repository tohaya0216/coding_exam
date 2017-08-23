class Recipe < ApplicationRecord
   has_many :recipe_processes, dependent: :destroy
   has_many :materials, dependent: :destroy
end
