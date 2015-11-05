class AddUserRateToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_rate, :integar
  end
end
