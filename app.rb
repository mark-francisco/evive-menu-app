require_relative "meal.rb"

menu_mapping = {
  "1" => "Main",
  "2" => "Side",
  "3" => "Drink",
  "4" => "Dessert",
}

puts "Enter your order in the following format: 'Meal item1,item2,item3'."
puts "When you are done, input 'exit' to quit the application."

while true
  puts "What's the order?"
  order_input = gets.chomp
  if order_input.downcase == "exit"
    puts "Thanks for dining with us. Come again soon."
    return
  end

  order_input = order_input.split(" ")

  if order_input[0].capitalize() == "Breakfast"
    meal = Breakfast.new
  elsif order_input[0].capitalize() == "Lunch"
    meal = Lunch.new
  elsif order_input[0].capitalize() == "Dinner"
    meal = Dinner.new
  else
    puts "Sorry, that's not a valid meal."
    return
  end

  menu_array = order_input[1].split(",")

  menu_array.map! { |item|
    item = menu_mapping[item]
  }
  menu_array.each { |menu_course|
    meal.order[menu_course] += 1
  }

  meal.validate_meal_rules
  meal.convert_to_menu_items
  if meal.is_a?(Breakfast)
    meal.validate_breakfast_rules
  elsif meal.is_a?(Lunch)
    meal.validate_lunch_rules
  elsif meal.is_a?(Dinner)
    meal.validate_dinner_rules
  end

  final_output = []
  meal.order.each { |key, value|
    if value == 1
      final_output << key
    elsif value > 0
      final_output << "#{key}(#{value})"
    end
  }
  pp final_output.join(", ")
end
