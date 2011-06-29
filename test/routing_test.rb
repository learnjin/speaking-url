require 'test_helper'

class NavigationTest < ActionController::IntegrationTest

  def setup
    Article.delete_all
  end

  test "nonexistent url" do
    a = Article.new
    a.add_mapping("/articles/1")
    assert_raise ActionController::RoutingError do 
      get "/foo/bar"
    end
  end

  test "current url" do
    a = Article.new
    a.add_mapping("/articles/1")
    get "/articles/1"
    assert_response :success
  end

  test "old url" do
    a = Article.new
    a.add_mapping("/articles/1")
    a.add_mapping("/new/url")
    get "/articles/1"
    assert_redirected_to "/new/url"
  end

  test "301 response for old url" do
    a = Article.new
    a.add_mapping("/articles/1")
    a.add_mapping("/new/url")
    get "/articles/1"
    assert_response 301
  end

end


class RoutesConfigurationTest < ActionController::TestCase

  test "controller specification" do

    with_routing do |set|
      set.draw do |map|
        speaking_url_resource :article, :controller => 'nested/articles'
      end

      Article.delete_all
      a = Article.new
      a.add_mapping("/foo/bar")

      assert_recognizes({:controller => 'nested/articles', :action => 'show', :path => "foo/bar"}, {:path => '/foo/bar'})

    end

  end

end



