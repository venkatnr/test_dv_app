class AddOrdercustToStories < ActiveRecord::Migration
  def change
    add_column :stories, :order_cust, :integer
  end
end
