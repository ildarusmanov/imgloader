require 'rails_helper'

describe Image, type: :model do
  let(:sourcelink) do
    Sourcelink.create(url: "http://test.link.com")
  end

  let(:valid_attributes) do
    {
      sourcelink_id: sourcelink.id,
      source_url: "http://test.link.com/test.png",
      url: "http://uploaded.test.com/image.png",
    }
  end

  let(:invalid_attributes) do
    {} 
  end

  it { expect(Image.new(invalid_attributes).valid?).to be_falsey }
  it { expect(Image.new(valid_attributes).valid?).to be_truthy }

  it "Should be able to create new image with valid attributes" do
    image = Image.create(valid_attributes)

    expect(image.sourcelink_id).to eq(valid_attributes[:sourcelink_id])
    expect(image.source_url).to eq(valid_attributes[:source_url])
    expect(image.url).to eq(valid_attributes[:url])
  end

  it "should not be able to create two images with same source_url and sourcelink_id" do
    image1 = Image.create(valid_attributes)
    image2 = Image.create(valid_attributes)

    expect(image2.persisted?).to be_falsey
  end
end

