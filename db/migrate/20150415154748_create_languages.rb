class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :language
      t.integer :lang_id

      t.timestamps
    end
  end
end
