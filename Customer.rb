class Customer

  attr_reader :name, :wallet, :age, :drunkness

  def initialize(name, wallet, age)

    @name = name
    @wallet = wallet
    @age = age
    @drunkness = 0

  end

  def reduce_funds(amount)
    @wallet -= amount
  end

  def increase_drunkness(amount)
    @drunkness += amount
  end

  def buy_drink(pub, drink)
    if pub.check_customer_age(@age) == true

      if pub.check_drunkness(@drunkness) == false

        pub.remove_drink(drink)
        reduce_funds(drink.price)
        pub.increase_till(drink.price)
        increase_drunkness(drink.alcohol_level)

      end

    end
  end

end
