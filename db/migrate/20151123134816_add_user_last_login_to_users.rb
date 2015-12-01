class AddUserLastLoginToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_last_login, :string
  end
end
