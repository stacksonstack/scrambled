class Player < ActiveRecord::Base
    # attr_reader :email_address, :password, :username
    has_many :games
    has_many :words , through: :games 

    def wins
        self.games.all.find_all{|game| game.status == "won"}
    end

    def self.top_ten
        ranking = self.all.sort_by{|player| player.wins.count}.reverse
        if ranking.length < 10
            standing = 1
            ranking[0..ranking.length-1].each do |player|
                puts "#{standing}. #{player.username} "
                standing += 1
            end
        else
            standing = 1
            ranking[0..9].each do |player|
                puts "#{standing}. #{player.username} "
                standing += 1
            end
        end
        return
    end

end


# ranking.length-1

# Player class
#  Attrs: username, password, email_address
# Instance methods
# Get all games
# Get all wins
# Class methods
# Get all players
# Get top 10 players
