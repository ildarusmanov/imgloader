require "rails_helper"

feature "User visits homepage" do
  scenario "Successfully" do
    visit root_path

    expect(page).to have_http_status(200)
  end
end
