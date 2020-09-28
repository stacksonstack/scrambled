class Word < ActiveRecord::Base
    # attr_reader :word_type, :definition, :word, :difficulty
    has_many :games
    has_many :players , through: :games 

    def hint
        if word.difficulty == "Easy"
            self.word_type
        else
            self.definition
        end
    end
    
end

# Word class
# Attrs: difficulty, hint (cond on difficulty; either word type or definition)
