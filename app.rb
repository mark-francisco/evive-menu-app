puts "Welcome to the Menu Ordering System."
puts "Enter your order in the following format: 'Meal item1,item2,item3'."
puts "When you are done, input 'exit' to quit the application."

# note to self: consider moving data variables to a different file
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

while true
  puts "What's the order?"
  order = gets.chomp
  if order.downcase == "exit"
    puts "Thanks for dining with us. Come again soon."
    break
  end
  order = order.split(" ")
  meal = order[0].capitalize()
  menu_items = order[1].split(",")

  current_menu = menus.select { |key, _value|
    key == meal
  }

  menu_items.map! { |menu_item|
    menu_item = menu_mapping[menu_item]
  }

  pp menu_items

  # menu_items.each { |menu_item|
  #   pp current_menu.select { |menu_course|
  #     menu_course == menu_mapping[menu_item]
  #   }
  # }
end
