require 'rails'
#require 'active_support/dependencies'

module SpeakingUrl
  require 'speaking_url/routing_extensions'
  autoload :MongoResource, 'speaking_url/mongo_resource'
end



