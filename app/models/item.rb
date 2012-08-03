class Item < ActiveRecord::Base
  attr_accessible :description, :list_id, :user_id
  belongs_to :list
  belongs_to :user
  validates :description, :presence => true
  delegate :project, :to => :list

  def member_list
     user_array = []
     self.project.users.each do |user|
       user_array << ["#{user.email}", user.id]
    end
    user_array
  end

end
