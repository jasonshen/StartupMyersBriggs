class MyersBriggs
	
	def initialize()
		@name = ""
		@mbscore = [0,0,0,0,]
		@knowledge = ""
		@qdata = []
		@decode = {
			"E" => 0, "I" => 0,
			"S" => 1, "N" => 1,
			"T" => 2, "F" => 2,
			"P" => 3, "J" => 3
			}
		@mbtype = [0,0,0,0,[0,0,0,0]]
	end

	def welcome()
		puts "Welcome to Jason's Simple Myers-Briggs Test"
		puts "What is your name?"
		@name = gets.chomp
		puts "Hi " + @name.capitalize + "!"
		sleep(1)
		puts "Do you know what the Myers-Briggs Test is? (yes/no)"
		@knowledge = gets.chomp.downcase
	end

	def explanation()
		case @knowledge
			when "yes", "y"
				puts "Alright, no need to rehash it then!"
			when "no", "n"
				puts "Well then, let me tell you a bit about it!"
				sleep(1)
				puts "The Myers-Briggs test is self-inventory designed to categorize how people perceive the world and make decisions."
				sleep(1)
				puts "While only a rough sketch of personality, a persons MBTI or Myers-Briggs Type Indicator can go a long way to helping understand how they might act in a given situation."
				sleep(2)
				puts "Over 50M people have taken this test since 1962."
				sleep (1)
				puts "Sound good? Press ENTER to continue!"
				gets.chomp
			else
				puts "I'm not sure I understood that, so let me tell you a bit about it!"
				sleep(1)
				puts "The Myers-Briggs test is self-inventory designed to categorize how people perceive the world and make decisions."
				sleep(1)
				puts "While only a rough sketch of personality, a persons MBTI or Myers-Briggs Type Indicator can go a long way to helping understand how they might act in a given situation."
				sleep(1)
				puts "Over 50M people have taken this test since 1962."
				sleep (1)
				puts "Sound good? Press ENTER to continue!"
				gets.chomp
		end
		sleep(1)
		puts "\e[H\e[2J"
		sleep(1)
		puts "Let's get started!"
		sleep(1)
		puts "We're going to go through some True or False questions. After answering, we'll generate a final MBTI for you."
		sleep(2)
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
			puts "(Type 'T' for true or 'F' for false, then hit ENTER)"
			answer = gets.chomp.upcase
		end
		return answer
	end

	def runtest
		i = 0
		category = ""
		answer = ""
		while i < @qdata.length
			puts "True or False: " + @qdata[i].first
			answer = input(answer)
			category = @qdata[i].last
			score(answer, category)
			i += 1
			answer = "N"
			puts "\e[H\e[2J"
		end
	end

	def typeinfo(array)
		case array
		when [1,1,1,1] #ESTP
			puts "Bonus info: Your type is often described as a 'Doer'."
			puts "A famous startup/tech person who is also of your type is Y."
		
		when [1,1,1,0] #ESTJ
			puts "Bonus info: Your type is often described as a 'Guardian'."
			puts "A famous startup/tech person who is also of your type is Donald Trump."

		when [1,1,0,1] #ESFP
			puts "Bonus info: Your type is often described as a 'Performer'."
			puts "A famous startup/tech person who is also of your type is Larry Ellison."

		when [1,1,0,0] #ESFJ
			puts "Bonus info: Your type is often described as a 'Caregiver'."
			puts "A famous startup/tech person who is also of your type is Y."

		when [1,0,0,0] #ENFJ
			puts "Bonus info: Your type is often described as a 'Giver'."
			puts "A famous startup/tech person who is also of your type is Sheryl Sandberg."

		when [1,0,0,1] #ENFP
			puts "Bonus info: Your type is often described as an 'Inspirer'."
			puts "A famous startup/tech person who is also of your type is Arianna Huffington."

		when [1,0,1,0] #ENTJ
			puts "Bonus info: Your type is often described as an 'Executive'."
			puts "A famous startup/tech person who is also of your type is Bill Gates."

		when [1,0,1,1] #ENTP
			puts "Bonus info: Your type is often described as a 'Visionary'."
			puts "A famous startup/tech person who is also of your type is Steve Wozniak."

		when [0,1,1,1] #ISTP
			puts "Bonus info: Your type is often described as a 'Mechanic'."
			puts "A famous startup/tech person who is also of your type is Jack Dorsey."

		when [0,1,1,0] #ISTJ
			puts "Bonus info: Your type is often described as an 'Inspector'."
			puts "A famous startup/tech person who is also of your type is Jeff Bezos."

		when [0,1,0,1] #ISFP
			puts "Bonus info: Your type is often described as an 'Artist'."
			puts "A famous startup/tech person who is also of your type is Jonathan Ive."

		when [0,0,1,1] #INTP
			puts "Bonus info: Your type is often described as a 'Thinker'."
			puts "A famous startup/tech person who is also of your type is Sergey Brin."

		when [0,0,1,0] #INTJ
			puts "Bonus info: Your type is often described as a 'Scientist'."
			puts "A famous startup/tech person who is also of your type is Mark Zuckerberg."

		when [0,0,0,1] #INFP
			puts "Bonus info: Your type is often described as an 'Idealist'."
			puts "A famous startup/tech person who is also of your type is Y."

		when [0,0,0,0] #INFJ
			puts "Bonus info: Your type is often described as a 'Confidant'."
			puts "A famous startup/tech person who is also of your type is Oprah Winfrey."
		else
			puts ""
		end

	end

	def results

		if @mbscore[0] > 0
			@mbtype[0] = "Extrovert"
			@mbtype[4][0] = 1
		else
			@mbtype[0] = "Introvert"
		end


		if @mbscore[1] > 0
			@mbtype[1] = "Sensor"
			@mbtype[4][1] = 1
		else
			@mbtype[1] = "Intuitor"
		end


		if @mbscore[2] > 0
			@mbtype[2] = "Thinker"
			@mbtype[4][2] = 1
		else
			@mbtype[2] = "Feeler"
		end


		if @mbscore[3] > 0
			@mbtype[3] = "Perceiver"
			@mbtype[4][3] = 1
		else
			@mbtype[3] = "Judger"
		end

		puts "Crunching massive amounts of data......"
		sleep(2)
		puts "\e[H\e[2J"
		print "Congrats " + @name.to_s + "! You are a: "
		@mbtype.each do |type|
			if type.is_a? String
				print " " + type
			else
			end
		end

		puts "."
		puts typeinfo(@mbtype[4])
	end



end

start = MyersBriggs.new()
start.welcome()
start.explanation()
start.questiondatabase()
start.runtest()
start.results()
