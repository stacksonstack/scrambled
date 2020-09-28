class CreateGameTable < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.integer :player_id
      t.integer :word_id
      t.string :status
      t.integer :incorrect_guesses
    end
  end
end
