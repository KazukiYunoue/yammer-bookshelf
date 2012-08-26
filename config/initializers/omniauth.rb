app_key = ENV["YAMMER_CONSUMER_KEY"]
app_secret = ENV["YAMMER_CONSUMER_SECRET"]
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :yammer , app_key , app_secret
end
