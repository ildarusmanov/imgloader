require "rails_helper"

describe LinkForm do
  let(:urls_validation_table) do
    {
      ok: %w(http://test.com http://test.ru/cat/1 https://test.v/g.html),
      error: %w(test another-test)
    }
  end

  let(:link_form) { LinkForm.new }

  it "should validate url attribute" do
    urls_validation_table[:ok].each do |valid_url|
      link_form.url = valid_url
      
      expect(link_form.valid?).to be_truthy
    end

    urls_validation_table[:error].each do |invalid_url|
      link_form.url = invalid_url

      expect(link_form.valid?).to be_falsey
    end
  end
end

