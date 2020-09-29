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