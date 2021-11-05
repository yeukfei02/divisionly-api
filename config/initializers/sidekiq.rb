redis_url = 'redis://localhost:6379/0'
redis_url = ENV['REDIS_URL'] if ENV['REDIS_URL'].present?

Sidekiq.configure_server do |config|
  config.redis = { url: redis_url }
end

Sidekiq.configure_client do |config|
  config.redis = { url: redis_url }
end
