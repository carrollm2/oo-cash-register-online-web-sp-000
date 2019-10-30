class CashRegister

  attr_accessor :total, :discount, :all_transactions

  def initialize(discount = 0)
    @total = 0.0
    self.discount = discount
    self.all_transactions = []
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
      transaction_event.each do |item_name, cost_and_quantity
        while counter < cost_and_quantity[1]
          items.push(item_name)
          counter += 1
        end
      end
    end
    items
  end

  def void_last_transaction

    voided_transaction_cost = 0.0
    voided_transaction = all_transactions.pop()

    voided_transaction.each do |voided|
      voided_cost = voided[1][0]
      voided_quantity = voided[1][1]
      voided_transaction_cost = voided_cost * voided_quantity
    end
    self.total -= voided_transaction_cost
  end

end


cash_register = CashRegister.new()

cash_register.add_item("Lucky Charms", 4.5)
cash_register.add_item("Ritz Crackers", 5.0)
cash_register.add_item("Justin's Peanut Butter Cups", 2.50, 2)

cash_register.items

cash_register.void_last_transaction
