class Iteration < ActiveRecord::Base
  belongs_to :project
  has_many :story
  attr_accessible :description, :end_date, :name, :start_date,:status, :iterationtype
  validates :end_date, :name, :start_date, :iterationtype, :presence => true
  #validates :name, :uniqueness => {:case_sensitive => false}

end
