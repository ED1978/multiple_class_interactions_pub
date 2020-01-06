require('minitest/autorun')
require('minitest/rg')
require_relative('../Customer.rb')
require_relative('../Pub.rb')
require_relative('../Pub.rb')
require_relative('../Drink.rb')

class CustomerTest < MiniTest::Test

def setup()

  @dave = Customer.new("Dave", 50.00)
  @pub = Pub.new("The Vic", 1000.00)
  @vodka = Drink.new("Vodka", 2.99)
  @rum = Drink.new("Rum", 2.50)
  @wine = Drink.new("Wine", 5.00)
  @beer = Drink.new("Beer", 2.50)

end

def test_get_customer_name()
  assert_equal("Dave", @dave.name)
end

def test_get_customer_wallet()
  assert_equal(50.00, @dave.wallet)
end

def test_reduce_funds()
  @dave.reduce_funds(2.50)
  assert_equal(47.50, @dave.wallet)
end

def test_buy_drink()

  @pub.add_drink(@vodka)
  @pub.add_drink(@rum)
  @pub.add_drink(@wine)
  @pub.add_drink(@beer)

  @dave.buy_drink(@pub, @vodka)

  assert_equal(3, @pub.get_stock_count())
  assert_equal(47.01, @dave.wallet)
  assert_equal(1002.99, @pub.till)

end

end
