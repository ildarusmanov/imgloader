require "rails_helper"

describe SourcelinkBuilder do
  let :images do
    [
      {url: "http://e.com/1.png", source_url: "http://t.com/1.png"},
      {url: "http://e.com/2.png", source_url: "http://t.com/2.png"},
      {url: "http://e.com/3.png", source_url: "http://t.com/3.png"},
    ]
  end

  let :builder do
    image_processor = double()
    allow(image_processor).to receive(:extract_images_from).and_return(images)
    SourcelinkBuilder.new(image_processor)
  end

  let(:create_params) do
    { url: "http://test.com/123" }
  end

  it { expect(builder).to respond_to(:create) }

  it "Should create new sourcelink" do
    sourcelink = builder.create(create_params)

    expect(sourcelink.url).to eq(create_params[:url])
    expect(sourcelink.images.length).to eq(images.length)
    expect(builder.has_errors?).to be_falsey
  end
end

