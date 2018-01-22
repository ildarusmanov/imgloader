class ImageUploader < CarrierWave::Uploader::Base
  storage :fog

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def store_file(filepath)
    store!(File.new(filepath, 'r'))

    url
  end
end
