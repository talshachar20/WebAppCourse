class AddLangIdToMemoCards < ActiveRecord::Migration
  def change
    add_column :memo_cards, :lang_id, :integer
  end
end
