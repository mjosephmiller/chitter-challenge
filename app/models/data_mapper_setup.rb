require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'user'


DataMapper.setup(:default, "postgres://localhost/chitter_development")
DataMapper.finalize
DataMapper.auto_upgrade!
