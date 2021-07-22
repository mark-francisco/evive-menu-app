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
  end

  def validate_meal_rules
    super
  end

  def convert_to_menu_items
    @order["Eggs"] = @order.delete("Main")
    @order["Toast"] = @order.delete("Side")
    if @order["Drink"] == 0
      @order.delete("Drink")
      @order["Water"] = 1
    else
      @order["Coffee"] = @order.delete("Drink")
    end
  end

  def validate_breakfast_rules
    if @order["Eggs"] && @order["Eggs"] > 1
      raise StandardError.new("Unable to process: Eggs cannot be ordered more than once")
    end

    if @order["Toast"] && @order["Toast"] > 1
      raise StandardError.new("Unable to process: Toast cannot be ordered more than once")
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
  end

  def validate_meal_rules
    super
  end

  def convert_to_menu_items
    @order["Sandwich"] = @order.delete("Main")
    @order["Chips"] = @order.delete("Side")
    if @order["Drink"] == 0
      @order.delete("Drink")
      @order["Water"] = 1
    else
      @order["Soda"] = @order.delete("Drink")
    end
  end

  def validate_lunch_rules
    if @order["Sandwich"] && @order["Sandwich"] > 1
      raise StandardError.new("Unable to process: Sandwich cannot be ordered more than once")
    end

    if @order["Soda"] && @order["Soda"] > 1
      raise StandardError.new("Unable to process: Soda cannot be ordered more than once")
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
  end

  def validate_meal_rules
    super
  end

  def convert_to_menu_items
    @order["Steak"] = @order.delete("Main")
    @order["Potatoes"] = @order.delete("Side")
    @order["Wine"] = @order.delete("Drink")
    @order["Water"] = 1
    @order["Cake"] = @order.delete("Dessert")
  end

  def validate_dinner_rules
    if @order["Cake"] < 1
      raise StandardError.new("Unable to process: Dessert is missing")
    end
  end
end
