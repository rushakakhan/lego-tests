require 'minitest/autorun'
require_relative 'lego'

class TestLego < Minitest::Test

  def setup
    @lego_hat = LegoHat.new("medium", "blue", "ball cap")
    @lego_jim = LegoMinifigure.new("Jim")
    @lego_item = LegoItem.new("Wand", 5)
    @lego_item_heavy = LegoItem.new("Sword", 11)
    @threshold = 10
  end

  def test_to_string_on_hat
    expected = "a medium blue ball cap"
    assert_equal(expected, @lego_hat.to_s)
  end

  def test_to_string_on_item
    expected = "a 5 gram Wand"
    assert_equal(expected, @lego_item.to_s)
  end

  def test_is_heavy_on_item
    assert(@lego_item.is_heavy(@threshold) == false)
  end

  def test_is_heavy_on_heavy_item
    assert(@lego_item_heavy.is_heavy(@threshold))
  end

  def test_to_string_on_figure_without_any_items
    expected = "A Lego minifigure named Jim."
    assert_equal(expected, @lego_jim.to_s)
  end

  def test_to_string_on_figure_with_hat
    @lego_jim.wear_hat(@lego_hat)
    expected = "A Lego minifigure named Jim, who is wearing a medium blue ball cap."
    assert_equal(expected, @lego_jim.to_s)
  end

  def test_to_string_on_figure_with_only_left_item
    @lego_jim.place_in_left_hand(@lego_item)
    expected = "A Lego minifigure named Jim, who is holding a 5 gram Wand in the left hand."
    assert_equal(expected, @lego_jim.to_s)
  end

  def test_to_string_on_figure_with_only_right_item
    @lego_jim.place_in_right_hand(@lego_item)
    expected = "A Lego minifigure named Jim, who is holding a 5 gram Wand in the right hand."
    assert_equal(expected, @lego_jim.to_s)
  end

  def test_to_string_on_figure_with_hat_and_left_item
    @lego_jim.wear_hat(@lego_hat)
    @lego_jim.place_in_left_hand(@lego_item)
    expected = "A Lego minifigure named Jim, who is wearing a medium blue ball cap and is holding a 5 gram Wand in the left hand."
    assert_equal(expected, @lego_jim.to_s)
  end

  def test_to_string_on_figure_with_hat_and_right_item
    @lego_jim.wear_hat(@lego_hat)
    @lego_jim.place_in_right_hand(@lego_item)
    expected = "A Lego minifigure named Jim, who is wearing a medium blue ball cap and is holding a 5 gram Wand in the right hand."
    assert_equal(expected, @lego_jim.to_s)
  end

  def test_to_string_on_figure_without_hat_but_with_both_items
    @lego_jim.place_in_left_hand(@lego_item)
    @lego_jim.place_in_right_hand(@lego_item)
    expected = "A Lego minifigure named Jim, who is holding a 5 gram Wand in the left hand and a 5 gram Wand in the right hand."
    assert_equal(expected, @lego_jim.to_s)
  end

  def test_to_string_on_figure_with_hat_and_both_items
    @lego_jim.wear_hat(@lego_hat)
    @lego_jim.place_in_left_hand(@lego_item)
    @lego_jim.place_in_right_hand(@lego_item)
    expected = "A Lego minifigure named Jim, who is wearing a medium blue ball cap and is holding a 5 gram Wand in the left hand and a 5 gram Wand in the right hand."
    assert_equal(expected, @lego_jim.to_s)
  end

  def test_is_stylish_on_figure_with_hat
    @lego_jim.wear_hat(@lego_hat)
    assert(@lego_jim.is_stylish?)
  end

  def test_is_stylish_raises_error_on_figure_without_hat
    assert_raises(NoMethodError) do
      @lego_jim.is_stylish?
    end
  end

  def test_swap_hands_works
    @lego_jim.place_in_left_hand(@lego_item)
    @lego_jim.place_in_right_hand(@lego_item_heavy)
    @lego_jim.swap_hands
    assert(@lego_jim.right_item == @lego_item && @lego_jim.left_item == @lego_item_heavy)
  end

  def test_is_strong_when_figure_has_no_items
    assert_raises(NoMethodError) do
      @lego_jim.is_strong?
    end
  end

end

