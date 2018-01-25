require "rails_helper"

describe ImageFile do
  let(:image_file_path) {"/tmp/somename.txt"}
  let(:image_file) { ImageFile.new(image_file_path) }

  it { expect(image_file.filepath).to eq(image_file_path) }
  it { expect(image_file).to respond_to(:original_filename) }
  it { expect(image_file).to respond_to(:write) }
  it { expect(image_file).to respond_to(:source_url) }
end
