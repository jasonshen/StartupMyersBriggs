class MyersBriggs
	
	def initialize()
		@name = ""
		@mbscore = [0,0,0,0]
		@knowledge = ""
		@qdata = []
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
		@qdata.push(["You would rather read a book at home than go out to a party. (T/F)", "I"])
		@qdata.push(["People often think you come with wild and interesting ideas. (T/F)", "N"])
	end

	def scoring(answer, category)
	end
		

	def runtest
		i = 0
		category = ""
		answer = ""
		while i < @qdata.length
			puts @qdata[i].first
			answer = gets.chomp
			category = @qdata[i].last
			case category
				when "E"
					if answer == "T"
						@mbscore[0] = @mbscore[0] + 1
					elsif answer == "F"
						@mbscore[0] = @mbscore[0] - 1
					else
						puts "We skipped this question"
					end
				when "I"
					if answer == "T"
						@mbscore[0] = @mbscore[0] - 1
					elsif answer == "F"
						@mbscore[0] = @mbscore[0] + 1
					else
						puts "We skipped this question"
					end

				when "S"
					if answer == "T"
						@mbscore[1] = @mbscore[1] + 1
					elsif answer == "F"
						@mbscore[1] = @mbscore[1] - 1
					else
						puts "We skipped this question"
					end
				when "N"
					if answer == "T"
						@mbscore[1] = @mbscore[1] - 1
					elsif answer == "F"
						@mbscore[1] = @mbscore[1] + 1
					else
						puts "We skipped this question"
					end

				when "T"
					if answer == "T"
						@mbscore[2] = @mbscore[2] + 1
					elsif answer == "F"
						@mbscore[2] = @mbscore[2] - 1
					else
						puts "We skipped this question"
					end
				when "F"
					if answer == "T"
						@mbscore[2] = @mbscore[2] - 1
					elsif answer == "F"
						@mbscore[2] = @mbscore[2] + 1
					else
						puts "We skipped this question"
					end

				when "P"
					if answer == "T"
						@mbscore[3] = @mbscore[3] + 1
					elsif answer == "F"
						@mbscore[3] = @mbscore[3] - 1
					else
						puts "We skipped this question"
					end
				when "J"
					if answer == "T"
						@mbscore[3] = @mbscore[3] - 1
					elsif answer == "F"
						@mbscore[3] = @mbscore[3] + 1
					else
						puts "We skipped this question"
					end
			end

			i += 1
		end
	end

	def results
		puts "Your E/I was:" + @mbscore[0].to_s
		puts "Your S/N was:" + @mbscore[1].to_s
	end



end

start = MyersBriggs.new()
start.welcome()
start.explanation()
start.questiondatabase()
start.runtest()
start.results()

