class MyersBriggs
	
	def initialize()
		@name = ""
		@mbscore = [0,0,0,0]
		@knowledge = ""
		@qdata = []
		@decode = { "E" => 0, "I" => 0, "S" => 1, "N" => 1, "T" => 2, "F" => 2, "P" => 3, "J" => 3 }
	end

	def welcome()
		puts "Welcome to Jason's Simple Myers-Briggs Test"
		puts "What is your name?"
		@name = gets.chomp
		puts "Hi " + @name.capitalize
		puts "Do you know what the Myers-Briggs Test is? (yes/no)"
		@knowledge = gets.chomp.downcase
	end

	def explanation()
		case @knowledge
			when "yes", "y"
				puts "Alright, no need to rehash it then!"
			when "no", "n"
				puts "Well then, let me tell you a bit about it!"
				sleep(2)
				puts "The Myers-Briggs test is self-inventory designed to categorize how people perceive the world and make decisions."
				sleep(2)
				puts "While only a rough sketch of personality, a persons MBTI or Myers-Briggs Type Indicator can go a long way to helping understand how they might act in a given situation."
				sleep(3)
				puts "Over 50M people have taken this test since 1962."
				sleep (2)
				puts "Sound good? Press ENTER to continue!"
				gets.chomp
			else
				puts "I'm not sure I understood that, so let me tell you a bit about it!"
				sleep(2)
				puts "The Myers-Briggs test is self-inventory designed to categorize how people perceive the world and make decisions."
				sleep(2)
				puts "While only a rough sketch of personality, a persons MBTI or Myers-Briggs Type Indicator can go a long way to helping understand how they might act in a given situation."
				sleep(2)
				puts "Over 50M people have taken this test since 1962."
				sleep (2)
				puts "Sound good? Press ENTER to continue!"
				gets.chomp
			end
		sleep(2)
		puts "Let's get started!"
		sleep(2)
		puts "We're going to go through 20 True or False questions. Try to answer them quickly and honestly."
		sleep(2)
		puts "We'll crunch a few numbers and generate a final MBTI for you, along with some thoughts about what it means."
		sleep(2)
		puts "Here we go!"
		sleep(2)
	end

	def questiondatabase
		@qdata.push(["You would rather read a book at home than go out to a party.)", "I"])
		@qdata.push(["People often think you come with wild and interesting ideas.", "N"])
	end

	def score(answer, category)
		catpointer = 0
		multiplier = 0
		
		case category
			when "E", "S", "F", "P"
				multiplier = 1
			else
				multiplier = -1
			end

		case category
			when "E", "I"
				catpointer = 0
			when "S", "N"
				catpointer = 1
			when "F", "T"
				catpointer = 2
			when "P", "J"
				catpointer = 3
			end

		if answer == "T"
			@mbscore[catpointer] = (multiplier * @mbscore[catpointer])
			puts "I ran the score method and recognized the response was T"
		if answer == "F"
			@mbscore[catpointer] = (-1 * multiplier * @mbscore[catpointer])
		end
	end



	end
		
	def input (answer)
		while (answer != "T" && answer != "F")
			puts "Please answer the question by typing T for true or F for false"
			answer = gets.chomp
		end
		return answer
	end

	def runtest
		i = 0
		category = ""
		answer = ""
		while i < @qdata.length
			puts @qdata[i].first
			sleep(2)
			answer = input(answer)
			category = @qdata[i].last
			score(answer, category)
			i += 1
			puts answer.to_s + " " + category.to_s
			answer = "N"
		end
	end

	def results
		puts "Your E/I score was:" + @mbscore[0].to_s
		puts "Your S/N score was:" + @mbscore[1].to_s
		puts "Your F/T score was:" + @mbscore[2].to_s
		puts "Your P/J score was:" + @mbscore[3].to_s
	end



end