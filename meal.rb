class Meal
  def validate_meal_rules
    if @order["Main"] < 1
      raise StandardError.new("Unable to proces: Main is missing")
    end
    if @order["Side"] < 1
      raise StandardError.new("Unable to proces: Side is missing")
    end
  end
end

class Breakfast < Meal
  attr_accessor :order

  def initialize
    @order = {
      "Main" => 0,
      "Side" => 0,
      "Drink" => 0,
    }
    @main = "Eggs"
    @side = "Toast"
    @drink = "Coffee"
  end

  def validate_meal_rules
    super
  end

  def convert_to_menu_items
    @order[@main] = @order.delete("Main")
    @order[@side] = @order.delete("Side")
    if @order["Drink"] == 0
      @order.delete("Drink")
      @order["Water"] = 1
    else
      @order[@drink] = @order.delete("Drink")
    end
  end

  def validate_breakfast_rules
    if @order[@main] && @order[@main] > 1
      raise StandardError.new("Unable to process: #{@main} cannot be ordered more than once")
    end

    if @order[@side] && @order[@side] > 1
      raise StandardError.new("Unable to process: #{@side} cannot be ordered more than once")
    end
  end
end

class Lunch < Meal
  attr_accessor :order

  def initialize
    @order = {
      "Main" => 0,
      "Side" => 0,
      "Drink" => 0,
    }
    @main = "Sandwich"
    @side = "Chips"
    @drink = "Soda"
  end

  def validate_meal_rules
    super
  end

  def convert_to_menu_items
    @order[@main] = @order.delete("Main")
    @order[@side] = @order.delete("Side")
    if @order["Drink"] == 0
      @order.delete("Drink")
      @order["Water"] = 1
    else
      @order[@drink] = @order.delete("Drink")
    end
  end

  def validate_lunch_rules
    if @order[@main] && @order[@main] > 1
      raise StandardError.new("Unable to process: #{@main} cannot be ordered more than once")
    end

    if @order[@drink] && @order[@drink] > 1
      raise StandardError.new("Unable to process: #{@drink} cannot be ordered more than once")
    end
  end
end

class Dinner < Meal
  attr_accessor :order

  def initialize
    @order = {
      "Main" => 0,
      "Side" => 0,
      "Drink" => 0,
      "Dessert" => 0,
    }
    @main = "Steak"
    @side = "Potatoes"
    @drink = "Wine"
    @dessert = "Cake"
  end

  def validate_meal_rules
    super
  end

  def convert_to_menu_items
    @order[@main] = @order.delete("Main")
    @order[@side] = @order.delete("Side")
    @order[@drink] = @order.delete("Drink")
    @order["Water"] = 1
    @order[@dessert] = @order.delete("Dessert")
  end

  def validate_dinner_rules
    if @order[@dessert] < 1
      raise StandardError.new("Unable to process: Dessert is missing")
    end
  end
end
