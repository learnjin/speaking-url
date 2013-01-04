# encoding: UTF-8
require 'test_helper'

class StringExtUrlify < Test::Unit::TestCase

  def test_space_delimited
    assert_equal 'Firstname-Lastname', "Firstname Lastname".urlify
  end

  def test_leading_and_trailing_space
    assert_equal 'Dr-Firstname-Lastname', "  Dr. Firstname Lastname  ".urlify
  end

  def test_leading_and_trailing_special_characters
    assert_equal 'Dr-Firstname-Lastname-1', "***  Dr. Firstname Lastname  #1 !!!".urlify
  end

end

class StringExtUnumlaut < Test::Unit::TestCase

  def test_replace_umlaute_with_ascii
    assert_equal "AEOEUESSaeoeuess","ÄÖÜSSäöüß".unumlaut
  end

end

class StringExtUpAndDowncase < Test::Unit::TestCase

  def test_make_umlaut_uppercase
    assert_equal "ÄÖÜSS", "äöüß".upcase
  end

  def test_make_umlaute_downcase
    assert_equal "äöüss","ÄÖÜSS".downcase
  end

end




