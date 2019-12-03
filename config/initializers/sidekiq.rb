Sidekiq.configure_server do |config|
  config.redis = { namespace: 'welovemerthyr' }
end
Sidekiq.configure_client do |config|
  config.redis = { namespace: 'welovemerthyr' }
end