ActiveRecord::Base.establish_connection(
  adapter:  'postgresql',
  host:     ENV['FMS_DB_HOST'] || 'localhost',
  username: ENV['FMS_DB_USER'],
  password: ENV['FMS_DB_PASS'],
  database: ENV['FMS_DB_NAME'],
  port: ENV['FMS_DB_PORT']
)
