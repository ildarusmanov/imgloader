require "rails_helper"

feature "User loads images from external URL" do
  before :all do
    @ext_url = "http://test.com"
    @file_link = "http://test.te/image.jpg"
    @html_content = <<-HERE
      Test #{@file_link} test
    HERE
   
    @fixture_file_path = Rails.root.join("spec", "fixtures", "image.jpg")

    stub_request(:any, @ext_url)
      .to_return(body: @html_content, status: 200)

    stub_request(:any, @file_link)
      .to_return(body: File.new(@fixture_file_path), status: 200)
  end

  scenario "Successfully" do
    visit root_path
    
    fill_in "link_form_url", with: @ext_url
    click_on "Send"

    expect(page).to have_http_status(200)
  end
end

