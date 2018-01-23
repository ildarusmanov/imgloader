CarrierWave.configure do |config|
  config.ignore_integrity_errors = false
  config.ignore_processing_errors = false
  config.ignore_download_errors = false

  if Rails.env.test?
    config.storage = :file
    config.enable_processing = false
    config.root = "#{Rails.root}/tmp"
  else
    config.storage :fog
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV['S3_KEY_ID'],
      aws_secret_access_key: ENV['S3_KEY_SECRET'],
      region:                ENV['S3_REGION'],
      path_style: true,
    }
  end

  # config.cache_dir = "#{Rails.root}/tmp/uploads" 
  config.fog_directory = ENV['S3_BUCKET']
end

