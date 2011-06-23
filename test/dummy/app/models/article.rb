class Article
  @@instances = []

  attr_reader :urls

  def initialize
    @@instances << self
    @urls = []
  end

  def current_url
    urls.last
  end

  def add_mapping(new_url)
    @urls << new_url
  end

  def self.delete_all
    @@instances = []
  end

  def self.find_by_url(url)
    @@instances.each do |instance|
      return instance if instance.urls.include?(url)
    end
    nil
  end

end


