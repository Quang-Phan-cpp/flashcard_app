class CreateFlashcards < ActiveRecord::Migration[8.1]
  def change
    create_table :flashcards do |t|
      t.string :word
      t.text :meaning
      t.text :example
      t.integer :level

      t.timestamps
    end
  end
end
