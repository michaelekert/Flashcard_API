class AddNotNullValueInFlashcardModel < ActiveRecord::Migration[7.0]
  def change
    change_column :flashcards, :question, :text, null: false
    change_column :flashcards, :answer, :text, null: false
  end
end
