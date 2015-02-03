class AddTranslationToMemoCard < ActiveRecord::Migration
  def change
    add_column :memo_cards, :translation, :string
  end
end
