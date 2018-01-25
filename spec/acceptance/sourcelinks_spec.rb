require "rails_helper"
require 'rspec_api_documentation/dsl'

resource "Sourcelinks" do
  get "/sourcelinks" do
    example "Sourcelinks listing" do
      do_request

      status.should == 200
    end
  end

  post "/sourcelinks" do
    parameter :url, required: true, scope: :sourcelink

    let(:sourcelink_url) { "http://test.com" }
    
    example "Create new sourcelink" do
      do_request

      status.should == 200
    end
  end

  get "/sourcelinks/:id" do
    let(:id) { sourcelink.id }
    
    example "Get sourcelink by ID" do
      do_request
    
      status.should == 200
    end
  end
end

