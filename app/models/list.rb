class List < ActiveRecord::Base
  attr_accessible :name, :project_id
  belongs_to :project
  validates :name, :presence => true
end
