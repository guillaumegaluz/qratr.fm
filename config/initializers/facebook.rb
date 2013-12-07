if Rails.env == 'development' || Rails.env == 'test'
  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, '1388716701376440', '76174072dc6964bee4e86edae1a7cded'
  end
else
  # Production
  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, '496824710431220', '5273fc497896c3b460f6f52277add54b'
  end
end
