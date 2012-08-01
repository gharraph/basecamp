class Project < ActiveRecord::Base
  attr_accessible :name, :private
  has_many :users, :through => :memberships
end
