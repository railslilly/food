require 'csv'

def foodie(food_type)
	puts "showing #{food_type}: \n"
	puts '=========================='
	puts "Food \t \t | Seeds"
	puts '=========================='
	CSV.foreach('food.csv', {:headers => true}) do |row|
		if(row['type'].split(':').include? food_type)
				puts "#{row['food']} \t | #{row['seeds'] == '1' ? 'yes' : 'no'}"
		end
	end	
end	


loop do 
  
  puts "Which food type would you like to look up? \n 1) fruit \n 2) vegetable \n 3) meat \n 4) yuck"
  prompt = gets.chomp


  if prompt == '1'
			foodie('fruit')
	elsif prompt == '2'
			foodie('vegetable')
	elsif prompt == '3'
			foodie('meat')
	elsif prompt == '4'
			foodie('yuck')
	else
  	puts "You have selected an invalid option"
	end

	puts "Do you want to look up another food type? (Y/N)"
  answer = gets.chomp
  break if answer.downcase != 'y'
  
end