require 'spec_helper'

describe Item do
  before :each do
    @project = Project.create(:name => "test project")
    @project.users.create(:id => 1, :email => "jessie@test.com")
    @project.users.create(:id => 2, :email => "sherief@test.com")
    @list = @project.lists.create(:name => "test list")
    @item = @list.items.create(:description => "I am so great")
  end

  describe 'member_list' do
    it 'pulls the list of user emails and ids for all members of the project' # do
    #       @item.member_list.should eq [["jessie@test.com", 1],["sherief@test.com", 2]]
    end
  end
end
