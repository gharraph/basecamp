class Project < ActiveRecord::Base
  attr_accessible :name, :private
  has_many :users, :through => :memberships
  has_many :memberships
  validates :name, :presence => true
  has_many :lists
  has_many :items, :through => :lists
  belongs_to :owner, :class_name => 'User'
end
