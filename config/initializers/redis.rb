redis_url = ENV['REDIS_URL'] || ''

redis_host = ENV['REDIS_HOST'] || 'localhost'
redis_port = ENV['REDIS_PORT'] || 6379
redis_username = ENV['REDIS_USERNAME'] || ''
redis_password = ENV['REDIS_PASSWORD'] || ''
redis_db = ENV['REDIS_DB'] || 0

$redis_url = Redis.new(url: redis_url)

$redis = Redis.new(host: redis_host,
                   port: redis_port.to_i,
                   username: redis_username,
                   password: redis_password,
                   db: redis_db.to_i)