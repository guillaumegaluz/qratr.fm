if Rails.env == 'production'
  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
  end
else
  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, '1388716701376440', '76174072dc6964bee4e86edae1a7cded'
  end
end
