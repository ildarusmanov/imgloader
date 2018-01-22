require "rails_helper"

describe Store do
  let :images_list do
    [ImageFile.new("/tmp/image.png")]
  end

  let(:uploaded_link) {"http://test.te/te/te/file.png"}
  
  let :store do
    uploader = double()
    allow(uploader).to receive(:store_file).and_return(uploaded_link)

    Store.new(uploader)
  end

  it { expect(store).to respond_to(:save_images) }

  it "should save images" do
    saved_images = store.save_images(images_list)

    expect(saved_images.length).to eq(images_list.length)
    expect(saved_images.first).to eq(uploaded_link)
  end
end

