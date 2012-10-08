class Attendance < ActiveRecord::Base
  belongs_to :story
  attr_accessible :date, :hours, :leave_type, :subject
end
