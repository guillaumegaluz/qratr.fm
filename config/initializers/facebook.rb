ENV['FACEBOOK_APP_ID'] ||= "1388716701376440"
ENV['FACEBOOK_SECRET'] ||= "76174072dc6964bee4e86edae1a7cded"

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET']
end
