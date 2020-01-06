require('minitest/autorun')
require('minitest/rg')
require_relative('../Customer.rb')

class CustomerTest < MiniTest::Test

def setup()

  @dave = Customer.new("Dave", 50.00)
  @steve = Customer.new("Steve", 50.00)

end

def test_get_customer_name()
  assert_equal("Dave", @dave.name)
end

def test_get_customer_wallet()
  assert_equal(50.00, @dave.wallet)
end

end
