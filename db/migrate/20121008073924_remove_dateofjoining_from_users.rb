class RemoveDateofjoiningFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :Date_of_joining
      end

  def down
    add_column :users, :Date_of_joining, :date
  end
end
