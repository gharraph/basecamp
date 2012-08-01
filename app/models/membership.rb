class Membership < ActiveRecord::Base
  attr_accessible :project_id, :user_id
end
