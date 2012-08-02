class Item < ActiveRecord::Base
  attr_accessible :description, :list_id
  belongs_to :list
  belongs_to :user
  validates :description, :presence => true
  delegate :project, :to => :list

end
