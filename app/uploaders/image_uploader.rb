class ImageUploader < CarrierWave::Uploader::Base
  storage :fog

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def store_file(file)
    store!(file)

    url
  end
end
