require_relative('./Pub.rb')

class Pub

  attr_reader :name, :till, :drinks

  def initialize(name, till)

    @name = name
    @till = till
    @drinks = []

  end

  def get_stock_count()
    return @drinks.length
  end

  def add_drink(drink)
    @drinks.push(drink)
  end

  def remove_drink(drink)
    @drinks.delete(drink)
  end

  def increase_till(amount)
    @till += amount
  end

end
