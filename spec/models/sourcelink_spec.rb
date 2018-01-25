require 'rails_helper'

describe Sourcelink, type: :model do
  let :valid_sourcelink do
    build(:sourcelink)
  end

  let :invalid_sourcelink do
    build(:invalid_sourcelink)
  end

  let :sourcelink_with_images do
    create(:sourcelink, images_count: 10)
  end

  it { expect(valid_sourcelink.save).to be_truthy }
  it { expect(invalid_sourcelink.save).to be_falsey }
  it { expect(sourcelink_with_images.images.length).to eq(10) }
end

