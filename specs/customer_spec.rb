require('minitest/autorun')
require('minitest/rg')
require_relative('../Customer.rb')
require_relative('../Pub.rb')
require_relative('../Pub.rb')
require_relative('../Drink.rb')
require_relative('../Food.rb')

class CustomerTest < MiniTest::Test

def setup()

  @dave = Customer.new("Dave", 50.00, 18)
  @steve = Customer.new("Steve", 50.00, 16)
  @pub = Pub.new("The Vic", 1000.00)
  @vodka = Drink.new("Vodka", 2.99, 3)
  @rum = Drink.new("Rum", 2.50, 4)
  @wine = Drink.new("Wine", 5.00, 2)
  @beer = Drink.new("Beer", 2.50, 1)
  @pizza = Food.new("Pizza", 5.99, 2)


end

def test_get_customer_name()
  assert_equal("Dave", @dave.name)
end

def test_get_customer_wallet()
  assert_equal(50.00, @dave.wallet)
end

def test_get_age()
  assert_equal(18, @dave.age)
end

def test_get_drunkness()
  assert_equal(0, @dave.drunkness)
end

def test_reduce_funds()
  @dave.reduce_funds(2.50)
  assert_equal(47.50, @dave.wallet)
end

def test_increase_drunkness()
  @dave.increase_drunkness(2)
  assert_equal(2, @dave.drunkness)
end

def test_reduce_drunkness()
  @dave.increase_drunkness(5)
  @dave.reduce_drunkness(3)
  assert_equal(2, @dave.drunkness)
end

def test_buy_drink()
  @pub.add_drink(@vodka)
  @pub.add_drink(@rum)
  @pub.add_drink(@wine)
  @pub.add_drink(@beer)

  @dave.buy_drink(@pub, @vodka)

  assert_equal(3, @pub.get_drinks_count())
  assert_equal(47.01, @dave.wallet)
  assert_equal(1002.99, @pub.till)
end

def test_buy_drink_customer_over_age()
  @pub.add_drink(@vodka)
  @pub.add_drink(@rum)
  @pub.add_drink(@wine)
  @pub.add_drink(@beer)

  @dave.buy_drink(@pub, @vodka)

  assert_equal(3, @pub.get_drinks_count())
  assert_equal(47.01, @dave.wallet)
  assert_equal(1002.99, @pub.till)
  assert_equal(3, @dave.drunkness)
end

def test_buy_drink_customer_under_age()
  @pub.add_drink(@vodka)
  @pub.add_drink(@rum)
  @pub.add_drink(@wine)
  @pub.add_drink(@beer)

  @steve.buy_drink(@pub, @vodka)

  assert_equal(4, @pub.get_drinks_count())
  assert_equal(50.00, @dave.wallet)
  assert_equal(1000.00, @pub.till)
  assert_equal(0, @steve.drunkness)
end

def test_buy_drink_customer_not_drunk()
  @pub.add_drink(@vodka)
  @pub.add_drink(@rum)
  @pub.add_drink(@wine)
  @pub.add_drink(@beer)

  @dave.buy_drink(@pub, @vodka)

  assert_equal(3, @pub.get_drinks_count())
  assert_equal(47.01, @dave.wallet)
  assert_equal(1002.99, @pub.till)
  assert_equal(3, @dave.drunkness)
end

def test_buy_drink_customer_too_drunk()
  @pub.add_drink(@vodka)
  @pub.add_drink(@rum)
  @pub.add_drink(@wine)
  @pub.add_drink(@beer)

  @dave.buy_drink(@pub, @vodka)
  @dave.buy_drink(@pub, @rum)
  @dave.buy_drink(@pub, @wine)

  assert_equal(2, @pub.get_drinks_count())
  assert_equal(44.51, @dave.wallet)
  assert_equal(1005.49, @pub.till)
  assert_equal(7, @dave.drunkness)
end

def test_can_buy_food()

  @pub.add_drink(@vodka)
  @pub.add_drink(@rum)
  @pub.add_food(@pizza)

  @dave.buy_drink(@pub, @vodka)
  @dave.buy_drink(@pub, @rum)
  @dave.buy_food(@pub, @pizza)

  assert_equal(0, @pub.get_food_count())
  assert_equal(38.52, @dave.wallet.round(2))
  assert_equal(1011.48, @pub.till)
  assert_equal(5, @dave.drunkness)
end

end
