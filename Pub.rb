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

  def check_customer_age(age)
    if age >= 18
      return true
    else
      return false
    end
  end

  def check_drunkness(drunkness)
    if drunkness <= 5
      return false
    else
      return true
    end
  end

end
