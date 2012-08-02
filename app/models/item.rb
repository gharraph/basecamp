class Item < ActiveRecord::Base
  attr_accessible :description, :list_id
  belongs_to :list
  validates :description, :presence => true
end
