class AddDateToUsers < ActiveRecord::Migration
  def change
    add_column :users, :Date_of_joining, :date
  end
end
