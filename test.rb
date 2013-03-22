class MyersBriggs
	
	def initialize()
		@name = ""
		@mbscore = [0,0,0,0]
		@knowledge = ""
		@qdata = []
		@decode = {
			"E" => 0, "I" => 0,
			"S" => 1, "N" => 1,
			"T" => 2, "F" => 2,
			"P" => 3, "J" => 3
			}
		@mbtype = []
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
		sleep(1)
		puts "\e[H\e[2J"
		sleep(1)
		puts "Let's get started!"
		sleep(1)
		puts "We're going to go through some True or False questions. After answering, we'll generate a final MBTI for you."
		sleep(3)
		puts "Here we go!"
		sleep(1)
	end

	def questiondatabase
		@qdata.push(["you would rather read a book at home than go out to a party.", "I"])
		@qdata.push(["people often think you come with wild and interesting ideas.", "N"])
		@qdata.push(["you like to go with your gut when making important decisions.", "F"])
		@qdata.push(["in your opinion, it's better to keep plans loose and flexible.", "P"])
	end

	def score(answer, category)
		catpointer = 0
		multiplier = 0
		
		case category
			when "E", "S", "T", "P"
				multiplier = 1
			else
				multiplier = -1
		end

		catpointer = @decode[category]

		if answer == "T"
			@mbscore[catpointer] = (multiplier * 1 + @mbscore[catpointer])
		else
			@mbscore[catpointer] = (-1 * multiplier * 1 + @mbscore[catpointer])
		end
	end



		
	def input (answer)
		while (answer != "T" && answer != "F")
			puts "(Type 'T' for true or 'F' for false)"
			answer = gets.chomp
		end
		return answer
	end

	def runtest
		i = 0
		category = ""
		answer = ""
		while i < @qdata.length
			puts "True or False: " + @qdata[i].first
			sleep(0.5)
			answer = input(answer)
			category = @qdata[i].last
			score(answer, category)
			i += 1
			answer = "N"
		end
	end

	def results

		if @mbscore[0] > 0
			@mbtype[0] = "Extrovert"
		else
			@mbtype[0] = "Introvert"
		end


		if @mbscore[1] > 0
			@mbtype[1] = "Sensor"
		else
			@mbtype[1] = "Intuitor"
		end


		if @mbscore[2] > 0
			@mbtype[2] = "Thinker"
		else
			@mbtype[2] = "Feeler"
		end


		if @mbscore[3] > 0
			@mbtype[3] = "Perceiver"
		else
			@mbtype[3] = "Judger"
		end


		puts "You are a: " + @mbtype[0] + ", " + @mbtype[1] + ", " + @mbtype[2] + ", " + @mbtype[3] + "."
	end



end

start = MyersBriggs.new()
start.welcome()
start.explanation()
start.questiondatabase()
start.runtest()
start.results()
