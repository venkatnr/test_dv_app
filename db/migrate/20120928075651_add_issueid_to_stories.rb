class AddIssueidToStories < ActiveRecord::Migration
  def change
    add_column :stories, :issue_id, :string
    
  end
end
