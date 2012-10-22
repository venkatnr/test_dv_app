class Story < ActiveRecord::Base
  belongs_to :iteration
has_many :tasks, :dependent => :destroy
  attr_accessible :Estimated_hours, :customer, :disposition, :name, :order, :priority, :status, :tracker, :Type, :order_cust, :description 
 validates_uniqueness_of :name
has_many :attendances
end
