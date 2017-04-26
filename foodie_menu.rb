require 'csv'

def food_list
   array_hash = []
  CSV.foreach('food.csv', {:headers => true}) do |row| 
    array_hash << Hash[row.collect { |c,r| [c,r] }]
  end
    array_hash
end
puts food_list

def foodie_menu
puts "Which food type would you like to look up?  fruit|veg|meat|yuck"
foodie_asks_for = gets.chomp

  show_me_fruit if foodie_asks_for == "fruit"
  show_me_veg if foodie_asks_for == "veg"
  show_me_meat if foodie_asks_for == "meat"
  show_me_yuck if foodie_asks_for == "yuck"
end

def foods(type)
 food_list.each do |food|
    puts food["food"] if food["type"] == type
 end
end

def foods_match(regex_type)
 food_list.each do |food|
    puts food["food"] if food["type"].match(/#{regex_type}/)
  end 
end  

def show_me_fruit
  foods("fruit")
  foodie_menu
end

def show_me_meat
  foods("meat")
  foodie_menu
end

def show_me_veg
  foods_match("vegetable")
  foodie_menu
end

def show_me_yuck
  foods_match("yuck")
  foodie_menu
end

foodie_menu
