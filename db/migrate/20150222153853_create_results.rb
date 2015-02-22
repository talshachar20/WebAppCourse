class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :user_id
      t.integer :word_id
      t.integer :is_correct

      t.timestamps
    end
  end
end
