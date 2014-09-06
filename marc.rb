#5631216321 Kunnapat Rungruangsatien
#5631285621 Patchara Vanthongkam


require 'csv'
data = CSV.read('data.csv')
puts "-----------------------------------------------"
puts "------------- Class Manager V1.0b -------------"
puts "-----------------------------------------------\n\n"

check = true;
while  check
	puts "***********************************************"
	puts "              Select the Options."
	puts "***********************************************"
	choices = ["1. Student who has the highest and lowest score.", "2. Mean of Students' Score", "3. Most/Least Popular Colour", "4. Capitalize the last letter and Lowercase the first \n letter of first name and last name.","5. Exit"]
	puts choices
	print ">>> "
	score = Array.new(data.length-1)
	color = Array.new(data.length-1)

	for num in 1...data.length
		score[num-1] = data[num][1]
	end
	minmax = score.minmax

	for num in 1...data.length
		color[num-1] = data[num][2]
	end

	selectOption = gets.chomp.to_i
	if selectOption == 1
		puts "\n"
		for num in 1...data.length-1
			if data[num][1] == minmax[0]
				print "Min: "
				puts data[num][0]
			elsif data[num][1] == minmax[1]
				print "Max: " 
				puts data[num][0]
			end
		end
		puts "\n"
	elsif selectOption == 2
		puts "\n"
		temp = 0
		for num in 0...data.length
			temp = temp + data[num][1].to_f
		end
		print "Average Score is "
		puts temp/score.length
		puts "\n"
	elsif selectOption == 3
		 puts "\n"
		 count = Hash.new(0) 
		 color.each {|word| count[word] += 1} 
		 topColor, trash = count.first 
		 print "Most Favourite Color: " 
		 puts topColor 
		 leastColor, trash = count.to_a.last 
		 print "Least Favourite Color: " 
		 puts leastColor
		 puts "\n"
	elsif selectOption == 4
		puts "\n"
		for num in 1...data.length
			puts data[num][0].reverse.split(/\b/).map(&:capitalize).join.reverse
		end
		puts "\n"
	elsif selectOption == 5
		puts "\nBYE BYE "
		puts "\n-----------------------------------------------"
		check = false
	else
		puts "Don't trick me :)"	
	end
end