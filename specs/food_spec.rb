require('minitest/autorun')
require('minitest/rg')
require_relative('../Food.rb')

class FoodTest < MiniTest::Test

  def setup()

    @pizza = Food.new("Pizza", 5.99, 2)

  end

  def test_get_name()
    assert_equal("Pizza", @pizza.name)
  end

  def test_get_price()
    assert_equal(5.99, @pizza.price)
  end

  def test_get_rejuvenation_level()
    assert_equal(2, @pizza.rejuvenation_level)
  end

end
