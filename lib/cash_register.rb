require 'pry'

class CashRegister

attr_accessor :total, :discount, :items, :last_transaction

  def initialize(discount = 0.0)
    @total = 0
    @discount = discount
    @items = []
    @last_transaction = 0
  end

  def add_item(title, price, quantity = 1)
    @total += price * quantity
    @last_transaction = price * quantity
    num_times = quantity
    while num_times > 0
      @items << title
      num_times -= 1
    end
  end

  def apply_discount
    discount_value = self.discount
    if(discount_value > 0)
      self.total -= (self.total  * (discount_value/100.0))
      "After the discount, the total comes to $#{@total.round}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.total -= self.last_transaction
  end

end
