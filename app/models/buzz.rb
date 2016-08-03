require 'data_mapper'
require 'dm-postgres-adapter'

class Buzz
  include DataMapper::Resource

  property :id,       Serial
  property :buzz,     String
  property :time,     DateTime


  belongs_to :user

end
