class CreateWordTable < ActiveRecord::Migration[6.0]
  def change
    create_table :words do |t|
      t.string :word
      t.string :difficulty
      t.string :type
      t.string :definition
    end
  end
end
