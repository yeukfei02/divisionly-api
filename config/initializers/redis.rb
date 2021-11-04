redis_url = 'redis://localhost:6379'
redis_url = ENV['REDIS_URL'] if ENV['REDIS_URL'].present?

$redis = Redis.new(url: redis_url, ssl_params: { verify_mode: OpenSSL::SSL::VERIFY_NONE })
