categories = ['business','entertainment', 'general', 'health', 'science', 'sports', 'technology']

categories.each{ |category|
  Category.create(name:category, category_type:"general")
}
