puts "Welcome to the Menu Ordering System."
puts "Enter your order in the following format: 'Meal item1,item2,item3'."
puts "When you are done, input 'exit' to quit the application."

while true
  menu_mapping = {
    "1" => "Main",
    "2" => "Side",
    "3" => "Drink",
    "4" => "Dessert",
  }
  menus = {
    "Breakfast" => { "Main" => "Eggs", "Side" => "Toast", "Drink" => "Coffee" },
    "Lunch" => { "Main" => "Sandwich", "Side" => "Chips", "Drink" => "Soda" },
    "Dinner" => { "Main" => "Steak", "Side" => "Potatoes", "Drink" => "Wine", "Dessert" => "Cake" },
  }

  puts "What's the order?"
  order = gets.chomp
  if order.downcase == "exit"
    puts "Thanks for dining with us. Come again soon."
    break
  end

  order = order.split(" ")
  meal = order[0].capitalize()
  menu_array = order[1].split(",")

  # Validations
  if !order[1].include?("1")
    puts "Unable to process: Main is missing"
    # return
  elsif !order[1].include?("2")
    puts "Unable to process: Side is missing"
    # return
  end

  current_menu = menus.select { |key, _value|
    key == meal
  }.values[0]

  if !order[1].include?("3")
    current_menu["Drink"] = "Water"
    menu_array.push("3")
  end

  menu_array.sort!
  menu_array.map! { |menu_item|
    menu_item = menu_mapping[menu_item]
  }

  # pp menu_array
  # pp current_menu

  order_counts = {}

  menu_array.each { |menu_arr_item|
    if order_counts[current_menu[menu_arr_item]]
      order_counts[current_menu[menu_arr_item]] += 1
    else
      order_counts[current_menu[menu_arr_item]] = 1
    end
  }

  pp menu_array

  if meal == "Breakfast" && menu_array.count("Main") > 1
    puts "#{current_menu["Main"]} cannot be ordered more than once"
    # return
  end
  if meal == "Breakfast" && menu_array.count("Side") > 1
    puts "#{current_menu["Side"]} cannot be ordered more than once"
    # return
  end

  if meal == "Lunch" && menu_array.count("Main") > 1
    puts "#{current_menu["Main"]} cannot be ordered more than once"
    # return
  end
  if meal == "Lunch" && menu_array.count("Drink") > 1
    puts "#{current_menu["Drink"]} cannot be ordered more than once"
    # return
  end

  if meal == "Dinner" && menu_array.count("Dessert") < 1
    puts "Dessert is missing"
    # return
  end
  if meal == "Dinner"
    order_counts["Water"] = 1
    # return
  end

  final_output = []
  order_counts.each { |key, value|
    if value == 1
      final_output << key
    else
      final_output << "#{key}(#{value})"
    end
  }
  pp final_output.join(", ")
end

# TODO: object-oriented organization
# TODO: validations based on breakfast, lunch, dinner
# TODO: Minitest unit tests
