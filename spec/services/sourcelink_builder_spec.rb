require "rails_helper"

describe SourcelinkBuilder do
  let :images do
   %w("image1.png image2.png image3.png")
  end

  let :builder do
    image_processor = double()
    allow(image_processor).to receive(:extract_image_from).and_return(:images)
    SourcelinkBuilder.new(image_processor)
  end

  let(:link) { "http://test.com" }
  let(:create_params) do
    { sourcelink: { url: link } }
  end

  it { expect(builder).to respond_to(create) }
  it "Should create new sourcelink" do
    sourcelink = builder.create(create_params)

    expect(sourcelink.url).to eq(link)
    expect(sourcelink.images.length).to eq(images.length)
    expect(builder.errors.length).to eq(0)
  end
end

