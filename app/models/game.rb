class Game < ActiveRecord::Base
    belongs_to :word 
    belongs_to :player 

    def self.start_game(player,word)
        Game.create(player: player, word: word, status: "in progress", incorrect_guesses: 0)
    end

    def game_lost
        self.update_attribute(:status, "lost")
        a = Artii::Base.new :font => 'slant'
        puts a.asciify("You lost...").colorize(:cyan)
    end

    def game_won
        self.update_attribute(:status, "won")
        a = Artii::Base.new :font => 'slant'
        puts a.asciify("You won!").colorize(:cyan)
    end

end