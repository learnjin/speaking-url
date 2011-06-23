require 'test_helper'

class Article
  @@instances = []

  attr_reader :urls

  def initialize
    @@instances << self
    @urls = []
  end

  def current_url
    @urls.last
  end

  def add_mapping(new_url)
    @urls << new_url
  end

  def self.clear_all
    @@instances = []
  end

  def self.find_by_url(url)
    @@instances.each do |instance|
      return instance if instance.urls.include?(url)
    end
    nil
  end

end


class ArticlesController < ActionController::Base; end

class ArticlesControllerTest < ActionController::TestCase

  def setup
    @routes = ActionDispatch::Routing::RouteSet.new
    @routes.draw do
      speaking_url_resource :article
    end
    Article.clear_all
  end

  def test_no_resource
    assert_raise ActionController::RoutingError do  
      assert_routing "/articles/1", :controller => "articles_controller", :action => "show"
    end
  end

  def test_simple
    Article.new.add_mapping("/articles/1")
    assert_routing "/articles/1", :controller => "articles", :action => "show", :path => "articles/1"
  end

end



