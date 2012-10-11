class Holiday < ActiveRecord::Base
  attr_accessible :date, :subject
  validates_uniqueness_of :date,:subject , :case_sensitive => false
end
