require('minitest/autorun')
require('minitest/rg')
require_relative('../Drink.rb')

class DrinkTest < MiniTest::Test

def setup()
  @vodka = Drink.new("Vodka", 2.99, 3)
  @rum = Drink.new("Rum", 2.50, 4)
  @wine = Drink.new("Wine", 5.00, 2)
  @beer = Drink.new("Beer", 2.50, 1)
end

def test_get_drink_name()
  assert_equal("Vodka", @vodka.name)
end

def test_get_drink_price()
  assert_equal(2.99, @vodka.price)
end

def test_get_alcohol_level()
  assert_equal(3, @vodka.alcohol_level)
end

end
