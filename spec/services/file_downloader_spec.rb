require "rails_helper"

describe FileDownloader do
  let(:file_link) {"http://test.te/image.jpg"}
  let(:fixture_file_path) {Rails.root.join("spec", "fixtures", "image.jpg")}
  let :downloader do
    stub_request(:any, file_link)
      .to_return(body: File.new(fixture_file_path), status: 200)

    FileDownloader.new(Pathname.new("/tmp"))
  end
 
  it { expect(downloader).to respond_to(:download_files) }
  
  it "should save downloaded files with unique names" do
    files = downloader.download_files([file_link, file_link])
    
    expect(files.length).to eq(2)
    expect(files.first).not_to eq(files.last)
    
    files.each do |filepath|
      expect(File.size(filepath)).to eq(File.size(fixture_file_path))
    end
  end
end

