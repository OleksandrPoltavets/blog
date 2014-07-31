OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '319870351523326', 'fd8bf362ce001408b6b960a61e86af30'
end