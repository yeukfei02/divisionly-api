redis_url = 'redis://localhost:6379/0'
redis_url = ENV['REDISCLOUD_URL']  if ENV['REDISCLOUD_URL'].present?
redis_url = ENV['REDIS_URL'] if ENV['REDIS_URL'].present?

$redis = Redis.new(url: redis_url)
