class AddTimeZoneAndNameToUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :time_zone, :string
    add_column :users, :name, :string
  end
end
