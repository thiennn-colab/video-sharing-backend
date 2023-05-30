require 'redis'

config = YAML::load(ERB.new(IO.read("#{Rails.root}/config/redis.yml")).result)[Rails.env].symbolize_keys
$redis = Redis.new(config)
