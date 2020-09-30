class Player < ActiveRecord::Base
    has_many :games
    has_many :words , through: :games 

    def wins
        self.games.all.find_all{|game| game.status == "won"}
    end

    def history
        system "clear"
        a = Artii::Base.new :font => 'slant'
        puts a.asciify("Game History").colorize(:cyan)
        self.games.all.each do |game|
            puts "\n\n- word: #{game.word.word} \n- scramble: #{game.word.scramble_word} \n- outcome: #{game.status}"
        end
    end

    def self.top_ten
        system "clear"
        ranking = self.all.sort_by{|player| player.wins.count}.reverse
        if ranking.length < 10
            standing = 1
            a = Artii::Base.new :font => 'slant'
            puts a.asciify("Current Leaderboard").colorize(:cyan)
            puts "\n\n"
            ranking[0..ranking.length-1].each do |player|
                puts "#{standing}. #{player.username} "
                standing += 1
            end
        else
            standing = 1
            a = Artii::Base.new :font => 'slant'
            puts a.asciify("Current Leaderboard").colorize(:cyan)
            puts "\n\n"
            ranking[0..9].each do |player|
                puts "#{standing}. #{player.username} "
                standing += 1
            end
        end
        # puts "\n\nDid you make it?"
        puts "\n\n"
        a = Artii::Base.new :font => 'slant'
        puts a.asciify("Did You Make It?").colorize(:cyan)
    end

end