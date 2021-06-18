require 'minitest/autorun'
require_relative 'lego'

class TestLego < Minitest::Test

  def setup
    @lego_hat = LegoHat.new("medium", "blue", "ball cap")
    @lego_jim = LegoMinifigure.new("Jim")
    @lego_item = LegoItem.new("Wand", 5)
  end

  def test_to_string_on_figure_without_any_items
    expected = "A Lego minifigure named Jim."
    assert_equal(expected, @lego_jim.to_s)
  end

  def test_to_string_on_hat
    expected = "a medium blue ball cap"
    assert_equal(expected, @lego_hat.to_s)
  end

  def test_is_strong_when_figure_has_no_items
    assert_raises(NoMethodError) do
      @lego_jim.is_strong?
    end
  end

end

