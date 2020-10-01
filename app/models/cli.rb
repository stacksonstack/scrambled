require 'rest-client' 
require 'json'
require 'pry'
require 'tty-prompt'
require 'artii'
require 'colorize'

class CLI

    def start_app
        welcome_animation
        welcome_menu
    end

    def welcome_menu
        # puts "Welcome to Scrambled!"
        system "clear"
        a = Artii::Base.new
        puts a.asciify("SCRAMBLED!").colorize(:cyan)
        a = Artii::Base.new :font => 'slant'
        puts a.asciify("Main Menu").colorize(:cyan)
        prompt = TTY::Prompt.new
        selection = prompt.select("Choose an option", ["Login", "Create Account", "Display Instructions"], help: "" )
        if selection == "Create Account"
            create_account
        elsif selection == "Display Instructions"
            display_instructions
        else
            login
        end
    end

    def login
        system "clear"
        a = Artii::Base.new :font => 'slant'
        puts a.asciify("Login").colorize(:cyan)
        un_prompt = TTY::Prompt.new
        username = un_prompt.ask("\n\nEnter your username: ")
        if !Player.all.map{|player| player.username}.include?(username)
            un_prompt = TTY::Prompt.new
            answer = un_prompt.select("That username doesn't exist.", ["Try Again","Go Back"] , help: "" )
            if answer == "Go Back"
                welcome_menu
            else
                login
            end
        end
        pw_prompt = TTY::Prompt.new
        password = pw_prompt.mask("Enter your password: ")
        until Player.all.find{|player| player.username == username}.password == password
            puts "Incorrect password! Please try again!\n\n"
            pw_prompt = TTY::Prompt.new
            password = pw_prompt.mask("Enter your password: ")
        end
        current_player = Player.all.find{|player| player.username == username}
        login_menu(current_player)
    end

    def login_menu(current_player)
        system "clear"
        a = Artii::Base.new :font => 'slant'
        puts a.asciify("Welcome!").colorize(:cyan)
        puts "Logged in as: #{current_player.username} "
        prompt = TTY::Prompt.new
        selection = prompt.select("\n\nChoose an option", ["Play Game","Check History","Leaderboard","Account Information","Log Out"] , help: "" )
        if selection == "Play Game"
            system "clear"
            a = Artii::Base.new :font => 'slant'
            puts a.asciify("Choose Your Difficulty").colorize(:cyan)
            prompt2 = TTY::Prompt.new
            difficulty = prompt.select("", ["Easy", "Hard", "Go Back"], help: "" )
            if difficulty == "Easy"
                system "clear"
                game = Game.start_game(current_player,Word.easy_words.shuffle[0])
                play_game(game)
            elsif difficulty == "Hard"
                system "clear"
                game = Game.start_game(current_player,Word.hard_words.shuffle[0])
                play_game(game)
            else 
                login_menu(current_player)
            end
        elsif selection == "Leaderboard"
            system "clear"
            Player.top_ten
            prompt = TTY::Prompt.new
            answer = prompt.select(" ", ["Go Back"] , help: "" )
            if answer == "Go Back"
                login_menu(current_player)
            end
        elsif selection == "Check History"
            system "clear"
            current_player.history
            prompt = TTY::Prompt.new
            answer = prompt.select(" ", ["Go Back"] , help: "" )
            if answer == "Go Back"
                login_menu(current_player)
            end
        elsif selection == "Account Information"
            account_information(current_player)
        else
            log_out
        end
    end

    def log_out
        system "clear"
        welcome_menu
    end

    def account_information(current_player)
        system "clear"
        a = Artii::Base.new :font => 'slant'
        puts a.asciify("Account Information").colorize(:cyan)
        prompt = TTY::Prompt.new
        answer = prompt.select("\n\nPlease select an option: ", ["Player Information","Update Information","Go Back"] , help: "" )
        if answer == "Player Information"
            player_information(current_player)
        elsif answer == "Update Information"
            update_account(current_player)
        else
            login_menu(current_player)
        end
    end

    def player_information(current_player)
        system "clear"
        a = Artii::Base.new :font => 'slant'
        puts a.asciify("Player Information").colorize(:cyan)
        puts "\n\nUsername: #{current_player.username}"
        puts "\n\nEmail Address: #{current_player.email_address}\n\n"
        prompt = TTY::Prompt.new
        answer = prompt.select(" ", ["Go Back"] , help: "" )
        if answer == "Go Back"
            account_information(current_player)
        end

    end

    def update_account(current_player)
        system "clear"
        a = Artii::Base.new :font => 'slant'
        puts a.asciify("Update Account").colorize(:cyan)
        prompt = TTY::Prompt.new
        answer = prompt.select("\n\nWhat do you want to update?", ["Password","Email Address","Go Back"] , help: "" )
        if answer == "Password"
            new_password = get_password
            current_player.update_attribute(:password, new_password)
            puts "\n\nPassword successfully updated!"
            sleep(1.2)
            account_information(current_player)
        elsif answer == "Email Address"
            new_email = get_email
            current_player.update_attribute(:email_address, new_email)
            puts "\n\nEmail address successfully updated!"
            sleep(1.2)
            account_information(current_player)
        else
            account_information(current_player)
        end
    end

    def play_game(game)
        scramble = game.word.scramble_word
        a = Artii::Base.new
        puts a.asciify("#{scramble}").colorize(:cyan)
        puts "#{scramble}"
        prompt = TTY::Prompt.new
        guess = prompt.ask("\n\nUnscramble this word: ")
        if game.word.word != guess.downcase
            puts "\n\nSorry, incorrect. Try again."
            game.incorrect_guesses += 1
            prompt = TTY::Prompt.new
            guess = prompt.ask("\n\nUnscramble this word: ")
            if game.word.word != guess.downcase
                puts "\n\nSorry, incorrect. Try again. But here's a hint: "
                game.incorrect_guesses += 1
                puts game.word.hint
                prompt = TTY::Prompt.new
                guess = prompt.ask("\n\nUnscramble this word: ")
                if game.word.word != guess.downcase
                    puts "\n\n"
                    game.game_lost
                    answer = prompt.select(" ", ["Go Back"] , help: "" )
                    if answer == "Go Back"
                        login_menu(game.player)
                    end
                end
            end
        end
        if game.word.word == guess.downcase
            puts "\n\n"
            game.game_won
            answer = prompt.select(" ", ["Go Back"] , help: "" )
            if answer == "Go Back"
                login_menu(game.player)
            end
        end
    end

    def create_account
        system "clear"
        a = Artii::Base.new :font => 'slant'
        puts a.asciify("Create An Account").colorize(:cyan)
        "\n\n"
        username = get_username
        puts "\n\n"
        email = get_email
        puts "\n\n"
        password = get_password
        Player.create(username: username, email_address: email, password: password)
        puts "\n\nAccounted was created successfully!"
        sleep(1.2)
        welcome_menu
    end

    def get_email
        prompt = TTY::Prompt.new
        email = prompt.ask("Enter your email address: ") { |q| q.validate :email , "Sorry that email is invalid, try again"}
        email2 = prompt.ask("Please confirm your email: ") 
        if email != email2
            puts "Your email didn't match, please try again!"
            get_email
        end
        return email
    end
    
    def get_password
        prompt = TTY::Prompt.new
        password = prompt.mask("Enter your password: ")
        until password.length >= 7 
            puts "Sorry, your password needs to be at least 7 characters! Try again."
            prompt = TTY::Prompt.new
            password = prompt.mask("Enter your password: ")
        end
        password2 = prompt.mask("Please confirm your password: ")
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
            puts "Sorry that username already exists please choose another one!\n\n"
            get_username
        end 
        return username
    end

    def display_instructions
        system "clear"
        a = Artii::Base.new :font => 'slant'
        puts a.asciify("How To Play").colorize(:cyan)
        puts "\n\n- You will be given a scrambled word where only the first letter is correct.\n\n"
        puts "- You have three chances to decode the word.\n\n"
        puts "- After two attempts a hint will be provided.\n\n"
        puts "- Happy unscrambling!!!\n\n"
        prompt = TTY::Prompt.new
        answer = prompt.select(" ", ["Go Back"] , help: "" )
        if answer == "Go Back"
            welcome_menu
        end
    end

end