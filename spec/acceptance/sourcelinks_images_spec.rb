require "rails_helper"
require 'rspec_api_documentation/dsl'

resource "Sourcelinks images" do
  get "/sourcelinks/:sourcelink_id/images" do
    let(:sourcelink_id) { sourcelink.id }

    example "Sourcelink images listing" do
      do_request

      status.should == 200
    end
  end

  get "/sourcelinks/:sourcelink_id/:id" do
    let(:sourcelink_id) { sourcelink.id }
    let(:id) { sourcelink_image.id }

    example "Sourcelink image" do
      do_request
    
      status.should == 200
    end
  end
end
