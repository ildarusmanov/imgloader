require "rails_helper"

describe PageParser do
  let(:base_url) {"http://test.te/catalog/1/page.html"}
  let :images_urls do
    [
       "http://test.image/test.jpg",
       "http://test.te/image.png",
       "http://test.te/catalog/img.gif",
    ]
  end

  let :page_content do
    <<-HERE
      <html>
        <body>
          Test <img src="/image.png"/> test
          <img src="http://test.image/test.jpg">
          test<img src="../img.gif"> test
        </body>
      </html>
    HERE
  end

  let(:page_parser) { PageParser.new }

  it "should parse all images url correctly" do
    links = page_parser.parse_links(page_content, base_url)

    images_urls.sort!
    links.sort!

    expect(links.length).to eq(images_urls.length)
    expect(links.first).to eq(images_urls.first)
    expect(links.last).to eq(images_urls.last)
  end  

  it { expect(page_parser).to respond_to(:parse_links) }
end

