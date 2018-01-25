require 'rails_helper'

describe Image, type: :model do
  let :invalid_image do
    build :invalid_image
  end

  let :valid_image do
    build :image
  end

  it { expect(invalid_image.valid?).to be_falsey }
  it { expect(valid_image.valid?).to be_truthy }
  it { expect(valid_image.save).to be_truthy }
end

