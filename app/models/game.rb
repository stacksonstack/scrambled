class Game < ActiveRecord::Base
    belongs_to :word 
    belongs_to :player 

    def self.start_game(player,word)
        puts "Unscramble this word!\n\n"
        Game.create(player: player, word: word, status: "in progress", incorrect_guesses: 0)
    end

    def game_lost
        # self.status = "lost"
        self.update_attribute(:status, "lost")
    end

    def game_won
        # self.status = "won"
        self.update_attribute(:status, "won")
    end

end