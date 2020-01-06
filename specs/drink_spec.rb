require('minitest/autorun')
require('minitest/rg')
require_relative('../Drink.rb')

class DrinkTest < MiniTest::Test

def setup()
  @vodka = Drink.new("Vodka", 2.99)
  @rum = Drink.new("Rum", 2.50)
  @wine = Drink.new("Wine", 5.00)
  @beer = Drink.new("Beer", 2.50)
end

def test_get_drink_name()
  assert_equal("Vodka", @vodka.name)
end

def test_get_drink_price()
  assert_equal(2.99, @vodka.price)
end

end
