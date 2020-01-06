require('minitest/autorun')
require('minitest/rg')
require_relative('../Pub.rb')
require_relative('../Drink.rb')
require_relative('../Customer.rb')
require_relative('../Food.rb')

class PubTest < MiniTest::Test

  def setup()

    @pub = Pub.new("The Vic", 1000.00)
    @vodka = Drink.new("Vodka", 2.99, 3)
    @rum = Drink.new("Rum", 2.50, 4)
    @wine = Drink.new("Wine", 5.00, 2)
    @beer = Drink.new("Beer", 2.50, 1)
    @dave = Customer.new("Dave", 50.00, 18)
    @steve = Customer.new("Steve", 50.00, 16)
    @mike = Customer.new("Mike", 50.00, 20)
    @pizza = Food.new("Pizza", 5.99, 2)

  end

  def test_get_pub_name()
    assert_equal("The Vic", @pub.name)
  end

  def test_get_pub_till()
    assert_equal(1000.00, @pub.till)
  end

  def test_get_drinks_count()
    assert_equal(0, @pub.get_drinks_count())
  end

  def test_get_food_count()
    assert_equal(0, @pub.get_food_count())
  end

  def test_add_food()
    @pub.add_food(@pizza)
    assert_equal(1, @pub.get_food_count())
  end

  def test_remove_food()
    @pub.add_food(@pizza)
    @pub.remove_food(@pizza)
    assert_equal(0, @pub.get_food_count())
  end

  def test_can_add_drink()
    @pub.add_drink(@vodka)
    assert_equal(1, @pub.get_drinks_count)
  end

  def test_can_remove_drink()
    @pub.add_drink(@vodka)
    @pub.add_drink(@rum)
    @pub.remove_drink(@rum)
    assert_equal(1, @pub.get_drinks_count)
  end

  def test_can_increase_till()
    @pub.increase_till(2.50)
    assert_equal(1002.50, @pub.till())
  end

  def test_check_customer_age_18()
    result = @pub.check_customer_age(18)
    assert_equal(true, result)
  end

  def test_check_customer_age_false()
    result = @pub.check_customer_age(16)
    assert_equal(false, result)
  end

  def test_check_customer_age_over()
    result = @pub.check_customer_age(20)
    assert_equal(true, result)
  end

  def test_check_drunkness_under_limit()
      result = @pub.check_drunkness(2)
      assert_equal(false, result)
  end

  def test_check_drunkness_over_limit()
    result = @pub.check_drunkness(6)
    assert_equal(true, result)
  end

  def test_check_drunkness_exact_limit
    result = @pub.check_drunkness(5)
    assert_equal(false, result)
  end

end
