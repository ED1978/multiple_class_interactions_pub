require('minitest/autorun')
require('minitest/rg')
require_relative('../Pub.rb')
require_relative('../Drink.rb')

class PubTest < MiniTest::Test

  def setup()

    @pub = Pub.new("The Vic", 1000.00)
    @vodka = Drink.new("Vodka", 2.99)
    @rum = Drink.new("Rum", 2.50)
    @wine = Drink.new("Wine", 5.00)
    @beer = Drink.new("Beer", 2.50)

  end

  def test_get_pub_name()
    assert_equal("The Vic", @pub.name)
  end

  def test_get_pub_till()
    assert_equal(1000.00, @pub.till)
  end

  def test_get_stock_count()
    assert_equal(0, @pub.get_stock_count())
  end

  def test_can_add_drink()
    @pub.add_drink(@vodka)
    assert_equal(1, @pub.get_stock_count)
  end

  def test_can_remove_drink()
    @pub.add_drink(@vodka)
    @pub.add_drink(@rum)
    @pub.remove_drink(@rum)
    assert_equal(1, @pub.get_stock_count)
  end

  def test_can_increase_till()
    @pub.increase_till(2.50)
    assert_equal(1002.50, @pub.till())
  end

end
