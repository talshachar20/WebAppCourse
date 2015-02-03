class CreateMemoCards < ActiveRecord::Migration
  def change
    create_table :memo_cards do |t|
      t.string :word
      t.integer :word_id , :primary => true

      t.timestamps
    end
  end
end
