Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, Facebook.config[:app_id], Facebook.config[:app_secret], { scope: Facebook.config[:perms], display: 'popup' }
end
