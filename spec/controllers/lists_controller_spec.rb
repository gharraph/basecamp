require 'spec_helper'

describe ListsController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show'
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    it "returns http success" do
      get 'edit'
      response.should be_success
    end
  end

  describe "GET '_form'" do
    it "returns http success" do
      get '_form'
      response.should be_success
    end
  end

  describe "GET '_lists'" do
    it "returns http success" do
      get '_lists'
      response.should be_success
    end
  end

end
