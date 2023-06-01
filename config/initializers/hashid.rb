Hashid::Rails.configure do |config|
  # salt is not confidential and it's ok to use same salt in every environment. 
  config.salt = "f2164396d5e0e10597da074b0b57fc08"
  config.min_hash_length = 22
  config.override_find = true
end
