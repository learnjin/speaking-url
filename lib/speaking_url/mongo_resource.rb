require 'mongoid'

module SpeakingUrl

  module MongoResource
    def self.included(klass)
      @@cocktails ||= []
      @@cocktails.push(klass).uniq!

      klass.instance_eval do 
        include Mongoid::Document
        field :urls, :type => Array, :default => []
      end

      klass.extend(ClassMethods)
    end

    def self.cocktails
      @@cocktails
    end

    def current_url
      urls.last
    end

    def add_mapping(new_url)
      urls << new_url
    end

    module ClassMethods
      def find_by_url(url)
        where(:urls => url).first
      end
    end

  end

end




