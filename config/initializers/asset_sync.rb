AssetSync.configure do |config|
  config.aws_access_key_id = Rails.application.credentials.aws[:aws_access_key_id]
  config.aws_secret_access_key = Rails.application.credentials.aws[:aws_secret_access_key]
  config.fog_directory = "grade-share_bucket"
  config.fog_provider = "AWS"
  config.fog_region = "ap-northeast-1"
  config.gzip_compression = true
end
