ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'models/user'
require_relative 'models/buzz'
require_relative 'models/data_mapper_setup'

require_relative 'server'
require_relative 'controllers/buzz'
require_relative 'controllers/sessions'
require_relative 'controllers/users'
