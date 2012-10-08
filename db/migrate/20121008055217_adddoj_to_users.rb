class AdddojToUsers < ActiveRecord::Migration
  def up
	add_column :leaves, :Date_of_joining, :date
	add_column :leaves, :employee_id, :string
	add_column :leaves, :no_of_hours, :float
	add_column :leaves, :group, :string
	
  end

  def down
  end
end
