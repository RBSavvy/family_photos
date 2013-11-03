CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => ENV['AWS_ACCESS_KEY'],
    :aws_secret_access_key  => ENV['AWS_SECRET_KEY']
  }
  config.fog_directory  = 'johnson-family-photos'
  config.fog_public     = false
  config.fog_attributes = {'Cache-Control'=>'public, max-age=315576000'}
end