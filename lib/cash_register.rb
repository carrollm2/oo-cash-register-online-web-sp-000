class CashRegister

  attr_accessor :total, :discount, :all_transactions

  def initialize(discount = 0)
    @total = 0.0
    self.discount = discount
    self.transactions = []
  end

  def add_item(item, cost, quantity=1)
    transaction = {}
    self.total += cost * quantity

    transaction[item] = [cost, quantity]
    all_transactions.push(transaction)
  end

  def apply_discount
    discount_message = ""
    if self.discount == 0
      discount_message = "There is no discount to apply."
    else
      discount_rate = self.discount / 100.0
      self.total *=  (1 - discount_rate.to_f)
      discount_message = "After the discount, the total comes to $#{(self.total).to_i}."
    end
  end

  def items
    items = []
    all_transactions.each do |transaction_event|
      counter = 0
      transaction_event.each do |item_name, number_of_items|
        while counter < number_of_items[1]
          items.push(item_name)
          counter += 1
        end
      end
    end
    items
  end

  def void_last_transaction

    voided_transaction_cost = 0.0
    voided_transaction = transactions.pop()

    voided_transaction.each do |voided|
      voided_transaction_cost = voided[1][0] * voided[1][1]
    end
    self.total -= voided_transaction_cost
  end

end
