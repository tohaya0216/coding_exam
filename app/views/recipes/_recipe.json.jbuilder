json.extract! recipe, :id, :title, :description, :expense, :time, :memo, :created_at, :updated_at
json.url recipe_url(recipe, format: :json)
