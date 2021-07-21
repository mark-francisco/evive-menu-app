class Meal
  def initialize
    @menu_mapping = {
      "1" => "Main",
      "2" => "Side",
      "3" => "Drink",
      "4" => "Dessert",
    }
  end
end

class Breakfast < Meal
  attr_accessor :main, :side, :drink

  def initialize(input_hash = {})
    @main = "Eggs"
    @side = "Toast"
    @drink = "Coffee" || "Water"
  end
end

class Lunch < Meal
  attr_accessor :main, :side, :drink

  def initialize
    @main = "Sandwich"
    @side = "Chips"
    @drink = "Soda"
  end
end

class Dinner < Meal
  attr_accessor :main, :side, :drink

  def initialize
    @main = "Steak"
    @side = "Potatoes"
    @drink = "Wine"
    @dessert = "Cake"
  end
end
