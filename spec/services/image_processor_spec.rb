require "rails_helper"

describe ImageProcessor do
  let(:url) {"http://test.com"}

  let :images do
    ["image1.png", "image2.png", "image3.png"]
  end

  let :files do
    ["t1.png", "t2.png", "t3.png"]
  end

  let(:html_content) {""}
  
  let :processor do
    parser = double()
    allow(parser).to receive(:parse_links).and_return(images)

    loader = double()
    allow(loader).to receive(:load_page).and_return(html_content)

    downloader = double()
    allow(downloader).to receive(:download_files).and_return(files)

    store = double()
    allow(store).to receive(:save_images).and_return(images)

    ImageProcessor.new(parser, loader, downloader, store)
  end

  it "should load images from url" do
    images = processor.extract_images_from(url)
    
    expect(images.length).to eq(images.length)
  end
end

