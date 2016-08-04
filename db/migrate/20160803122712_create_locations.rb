class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :ip_start
      t.string :ip_end
      t.string :country
    end
  end
end
