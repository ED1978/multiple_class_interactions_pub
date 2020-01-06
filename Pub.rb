require_relative('./Pub.rb')

class Pub

  attr_reader :name, :till, :drinks

  def initialize(name, till)

    @name = name
    @till = till
    @drinks = []
    @food = []

  end

  def get_drinks_count()
    return @drinks.length
  end

  def get_food_count()
    return @food.length
  end

  def add_drink(drink)
    @drinks.push(drink)
  end

  def remove_drink(drink)
    @drinks.delete(drink)
  end

  def add_food(food)
    @food.push(food)
  end

  def remove_food(food)
    @food.delete(food)
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

  def total_drinks_value()
    total = 0
    for drink in @drinks
      total += drink.price
    end
    return total
  end

  def total_food_value()
    total = 0
    for food_type in @food
      total += food_type.price
    end
    return total
  end

  def total_stock_value()
    return total_drinks_value() + total_food_value() 
  end
end
