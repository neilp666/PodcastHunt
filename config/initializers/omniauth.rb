Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['ACCESS_KEY_ID'], ENV['SECRET_ACCESS_KEY']
end
