class Customer

  attr_reader :name, :wallet

  def initialize(name, wallet)

    @name = name
    @wallet = wallet

  end

  def reduce_funds(amount)
    @wallet -= amount
  end

  def buy_drink(pub, drink)
    pub.remove_drink(drink)
    reduce_funds(drink.price)
    pub.increase_till(drink.price)
  end

end
