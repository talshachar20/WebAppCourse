class AddSessionIdToResults < ActiveRecord::Migration
  def change
    add_column :results, :session_id, :integer
  end
end
