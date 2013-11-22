require 'test/unit'
require 'phrzsr'

class PhrzsrTest < Test::Unit::TestCase

  def setup
    @@motivational_url = 'https://raw.github.com/Phrzsr/phrzsr/master/motivational'
  end

  def test_phrzsr_is_string
    assert_equal String, Phrzsr.phrzsr().class
  end

  def test_phrzsr_is_something
    assert 0 < Phrzsr.phrzsr().length
  end

  def test_phrzsr_is_something_different
    assert_not_equal Phrzsr.phrzsr(), Phrzsr.phrzsr()
  end

  def test_phrzsr_with_category_is_string
    assert_equal String, Phrzsr.phrzsr(:motivational).class
  end

  def test_phrzsr_raise_with_bad_category
    assert_raise CategoryError do
      Phrzsr.phrzsr(:fake).class
    end
  end

  def test_phrzsr_category_is_something_different
    assert_not_equal Phrzsr.phrzsr(:motivational), Phrzsr.phrzsr(:motivational)
  end

  def test_phrzsr_with_url_is_string
    assert_equal String, Phrzsr.phrzsr(@@motivational_url).class
  end

  def test_phrzsr_with_url_is_something_different
    assert_not_equal Phrzsr.phrzsr(@@motivational_url), Phrzsr.phrzsr(@@motivational_url)
  end

  def test_phrzsr_with_category_and_substition_is_string
    assert_equal String, Phrzsr.phrzsr(:motivational, ['Ricky']).class
  end

end