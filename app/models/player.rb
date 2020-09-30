class Player < ActiveRecord::Base
    has_many :games
    has_many :words , through: :games 

    def wins
        self.games.all.find_all{|game| game.status == "won"}
    end

    def history
        puts "#{self.username}'s History\n\n"
        self.games.all.each do |game|
            puts "-word: #{game.word.word} - scramble: #{game.word.scramble_word} - outcome: #{game.status}\n\n"
        end
    end

    def self.top_ten

        ranking = self.all.sort_by{|player| player.wins.count}.reverse
        if ranking.length < 10
            standing = 1
            puts "Current Leaderboard:\n\n"
            ranking[0..ranking.length-1].each do |player|
                puts "#{standing}. #{player.username} "
                standing += 1
            end
        else
            standing = 1
            puts "Current Leaderboard:\n\n"
            ranking[0..9].each do |player|
                puts "#{standing}. #{player.username} "
                standing += 1
            end
        end
        puts "\n\nDid you make it?"
    end

end