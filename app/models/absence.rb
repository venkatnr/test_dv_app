class Absence < ActiveRecord::Base
  attr_accessible :date_of_joining, :emp_name, :employee_id, :group, :no_of_hours, :user_id
  validates_uniqueness_of :emp_name,:employee_id
end
