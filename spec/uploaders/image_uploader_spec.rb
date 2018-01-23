require "rails_helper"

describe ImageUploader do
  let(:uploader) { ImageUploader.new }
  let(:fixture_file_path) { Rails.root.join("spec", "fixtures", "image.jpg") }

  it { expect(uploader).to respond_to(:store_file) }
  it { expect(uploader).to respond_to(:url) }
end
