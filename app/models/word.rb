class Word < ActiveRecord::Base
    # attr_reader :word_type, :definition, :word, :difficulty
    has_many :games
    has_many :players , through: :games 

    def hint
        if self.difficulty == "Easy"
            "Part of speech is: #{self.word_type}"
        else
            "Definition: #{self.definition}"
        end
    end

    def scramble_word
        scramble = self.word
        until scramble != self.word 
            scramble = self.word[1..self.word.length-1].split("").shuffle.join
            scramble = self.word[0] + scramble
        end 
        return scramble
    end

    def self.easy_words
        self.all.find_all{|word| word.difficulty == "Easy"}
    end

    def self.hard_words
        self.all.find_all{|word| word.difficulty == "Hard"}
    end
    
end

# Word class
# Attrs: difficulty, hint (cond on difficulty; either word type or definition)
