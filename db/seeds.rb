Category.destroy_all
categories = ["apero", "petit-déj", "déjeuner", "dinner", "spéciale"]
categories.each do |category|
  Category.create!(name: category)
end
