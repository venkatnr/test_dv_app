class Iteration < ActiveRecord::Base
  belongs_to :project
  has_many :story, :dependent => :destroy
  attr_accessible :description, :end_date, :name, :start_date,:status, :iterationtype
  validates  :name, :start_date, :iterationtype, :presence => true
  #validates :name, :uniqueness => {:case_sensitive => false}

end
