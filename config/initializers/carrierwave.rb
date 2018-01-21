CarrierWave.configure do |config|
  config.ignore_integrity_errors = false
  config.ignore_processing_errors = false
  config.ignore_download_errors = false
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider:              'AWS',
    aws_access_key_id:     ENV['S3_KEY_ID'],
    aws_secret_access_key: ENV['S3_KEY_SECRET'],
    region:                'eu-west-1',
  }

  config.fog_directory  = ENV['S3_BUCKET']
end

