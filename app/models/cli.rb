require 'rest-client' 
require 'json'
require 'pry'
require 'tty-prompt'

class CLI 

    def welcome_menu
        puts "Welcome to Scrambled!"
        prompt = TTY::Prompt.new
        selection = prompt.select("Choose an option", ["Login", "Create Account", "Display Instructions"])
        if selection == "Create Account"
            create_account
        elsif selection == "Display Instructions"
            display_instructions
        else
            login
        end
            
    end

    def login
        #grab username
        un_prompt = TTY::Prompt.new
        username = un_prompt.ask("Enter your username: ")
        #check if username exists
        if !Player.all.map{|player| player.username}.include?(username)
            puts "That username doesn't exist. Please try again!"
            login
        end
        #check for password
        pw_prompt = TTY::Prompt.new
        password = pw_prompt.ask("Enter your password: ")
        #check if password is correct
        until Player.all.find{|player| player.username = username}.password == password
            puts "Incorrect password! Please try again!"
            pw_prompt = TTY::Prompt.new
            password = pw_prompt.ask("Enter your password: ")
        end
        current_player = Player.all.find{|player| player.username = username}
        login_menu(current_player)
    end

    def play_game(game)
        scramble = game.word.scramble_word
        puts scramble
        prompt = TTY::Prompt.new
        guess = prompt.ask("Enter your guess: ")
        if game.word.word != guess
            puts "Sorry, incorrect. Try again."
            game.incorrect_guesses += 1
            prompt = TTY::Prompt.new
            guess = prompt.ask("Enter your guess: ")
            if game.word.word != guess
                puts "Sorry, incorrect. Try again. But here's a hint: "
                game.incorrect_guesses += 1
                puts game.word.hint
                prompt = TTY::Prompt.new
                guess = prompt.ask("Enter your guess: ")
                if game.word.word != guess
                    puts "Sorry, you lost!"
                    game.game_lost
                    login_menu(game.player)
                end
            end
        end
        if game.word.word == guess
            puts "Congrats! You guessed correctly!"
            game.game_won
            login_menu(game.player)
        end
    end

    def login_menu(current_player)
        puts "Placeholder for login message"
        prompt = TTY::Prompt.new
        selection = prompt.select("Choose an option", ["Play Game","Check History"])
        if selection == "Play Game"
            prompt2 = TTY::Prompt.new
            difficulty = prompt.select("Choose your difficulty", ["Easy", "Hard", "Go Back"])
            if difficulty == "Easy"
                game = Game.start_game(current_player,Word.easy_words.shuffle[0])
                play_game(game)
            elsif difficulty == "Hard"
                game = Game.start_game(current_player,Word.hard_words.shuffle[0])
                play_game(game)
            else
                login_menu(current_player)
            end
        end
    end

    #login menu will show 1.play game 2.check history
    # def login_menu

    # end

    def create_account
        username = get_username
        email = get_email
        password = get_password
        Player.create(username: username, email_address: email, password: password)
        welcome_menu
    end

    def select
        prompt = TTY::Prompt.new
        answer = prompt.select("What's good?", ["everything!","nothing","third choice"])
        puts answer
    end

    #implement Artii vvv
    def display_instructions
        puts "How to Play"
        puts "You will be given a scrambled word where only the first letter is correct."
        puts "You have three chances to decode the word."
        puts "After two attempts a hint will be provided."
        puts "Happy unscrambling!!!"
        prompt = TTY::Prompt.new
        answer = prompt.select("Go Back", ["Yes"])
        if answer == "Yes"
            welcome_menu
        end
    end

    def get_email
        prompt = TTY::Prompt.new
        email = prompt.ask("Enter your email address: ")
        email2 = prompt.ask("Please confirm your email: ")
        if email != email2
            puts "Your email didn't match, please try again!"
            get_email
        end
        return email
    end

    #change logic so when user enters password it's replaced with asteriks
    def get_password
        prompt = TTY::Prompt.new
        password = prompt.ask("Enter your password: ")
        password2 = prompt.ask("Please confirm your password: ")
        if password != password2
            puts "Your password didn't match, please try again!"
            get_password
        end
        return password
    end

    def get_username
        prompt = TTY::Prompt.new
        username = prompt.ask("Enter your username: ")
        usernames = Player.all.map{|player| player.username }
        if usernames.include?(username)
            puts "Sorry that username already exists please choose another one!"
            get_username
        end 
        return username
    end

    def yes
        prompt = TTY::Prompt.new
        answer = prompt.yes?("Yes?")
        if answer == true
           puts "answered yes"
        else
           puts "answered no"
        end
    end 

    
    def ask
        prompt = TTY::Prompt.new
        answer = prompt.ask("What's good?")
        bad_answers = ["bad","worst"]
        if bad_answers.include?(answer.downcase)
            puts "not good enough. try again."
            ask
        else 
            puts "answered: #{answer}"
        end
    end 
    
    def ask_req
        prompt = TTY::Prompt.new
        answer = prompt.ask("What's good?", required: true)
        puts "answered: #{answer}"
    end 
    
    

    

    def search_songs
        puts "What song are you looking for?"
        search_term = gets.chomp
        # 1. RestClient.get("spotify.api/searchQuery")
        # 2. JSON.parse
        # 3. Let the user make some choices 
        # 4. Say they choose a favorite, make the updates to your 
        #     DB to save the song info you need easy access to and to represent the favorite 
    end

end