require "rails_helper"

describe PageLoader do
  let(:page_body) {"my page body"}
  let(:page_url) {"http://test.page.url"}
  let(:another_page_url) {"http://test.another.page"}
  let :loader do
    stub_request(:any, another_page_url).to_raise(StandardError)

    stub_request(:get, page_url).to_return({
      status: 200,
      body: page_body,
      headers: {}
    })

    PageLoader.new
  end

  it "should load page content by url" do
    expect(loader.load_page(page_url)).to eq(page_body)
  end

  it "should return ampty content for unavailable page" do
    expect(loader.load_page(another_page_url)).to eq("")
  end

  it { expect(loader).to respond_to(:load_page) }
end

