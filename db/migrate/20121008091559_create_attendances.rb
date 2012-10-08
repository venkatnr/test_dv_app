class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.string :leave_type
      t.string :subject
      t.date :date
      t.float :hours
      t.references :story

      t.timestamps
    end
    add_index :attendances, :story_id
  end
end
