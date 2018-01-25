require 'rails_helper'

describe Sourcelink, type: :model do
  let :image_attrs do
    {
      source_url: "http://t.com/test.png",
      url: "http://e.com/img.png"
    }
  end

  let :valid_attrs do
    { url: "http://test.link.com" }
  end
 
  let :invalid_attrs do
    { url: "test" }
  end

  let :sourcelink_with_images do
    sourcelink = Sourcelink.create(link: "http://test.sourcelink.com")
    sourcelink.images.create(image_attrs)
    sourcelink
  end

  it { expect(Sourcelink.create(valid_attrs).persisted?).to be_truthy }
  it { expect(Sourcelink.create(invalid_attrs).persisted?).to be_falsey }
end

