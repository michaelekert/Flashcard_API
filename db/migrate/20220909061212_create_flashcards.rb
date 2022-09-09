class CreateFlashcards < ActiveRecord::Migration[7.0]
  def change
    create_table :flashcards do |t|
      t.text :question
      t.text :answer
      t.date :next_rep
      t.decimal :e_factory
      t.integer :interval

      t.timestamps
    end
  end
end
