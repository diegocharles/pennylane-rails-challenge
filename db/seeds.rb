# Read the JSON file
file = File.read(Rails.root.join('db', 'recipes-en.json'))
recipes_data = JSON.parse(file)

recipes_data[0..20].each do |recipe_data|
  puts "Creating recipe: #{recipe_data['title']}"
  recipe = Recipe.create(
    title: recipe_data['title'],
    cook_time: recipe_data['cook_time'],
    prep_time: recipe_data['prep_time'],
    ratings: recipe_data['ratings'],
    cuisine: recipe_data['cuisine'],
    category: recipe_data['category'],
    author: recipe_data['author'],
    image: recipe_data['image'],
    instructions: Faker::Food.description,
    ingredients: recipe_data['ingredients']
  )
end
