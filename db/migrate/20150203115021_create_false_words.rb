class CreateFalseWords < ActiveRecord::Migration
  def change
    create_table :false_words do |t|
      t.integer :word_id
      t.text :word
      t.integer :level

      t.timestamps
    end
  end
end
