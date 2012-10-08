class CreateAbsences < ActiveRecord::Migration
  def change
    create_table :absences do |t|
      t.date :date_of_joining
      t.string :employee_id
      t.float :no_of_hours
      t.string :emp_name
      t.string :group
      t.string :user_id

      t.timestamps
    end
  end
end
