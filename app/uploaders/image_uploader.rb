class ImageUploader < CarrierWave::Uploader::Base
  # this line may be uncommented when right AWS
  # credentials will be provided
  # storage :fog

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def store_file(filepath)
    store!(File.new(filepath, 'r'))

    url
  end
end
