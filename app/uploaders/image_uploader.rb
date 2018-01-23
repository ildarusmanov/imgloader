class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  storage :fog
  process resize_to_fill: [600, 600]
  process convert: 'png'

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def store_file(file)
    store!(file)

    url
  end

  def filename
    super.chomp(File.extname(super)) + '.png' if original_filename.present?
  end
end
