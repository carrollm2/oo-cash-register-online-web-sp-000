class CashRegister

  attr_accessor :total, :discount, :transactions

  def initialize(discount = 0)
    @total = 0.0
    self.discount = discount
    self.transactions = []
  end

  def add_item(item, cost, quantity=1)
    transaction = {}
    self.total += cost * quantity
    #transaction[item] = cost * quantity
    transaction[item] = [cost, quantity]
    transactions.push(transaction)
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
    transactions.each do |t|
      counter = 0
      t.each do |k, v|
        while counter < v[1]
          items.push(k)
          counter += 1
        end
      end
    end
    items
  end

  def void_last_transaction
    # print transactions
    voided_transaction = transactions.pop()
    # print "voided_transaction", voided_transaction, voided_transaction[item]
    # voided_transaction_cost = voided_transaction[item]
    voided_transaction_cost = voided_transaction
    self.total -= voided_transaction_cost
  end

end


a = CashRegister.new()

a.add_item("computer", 1000.0, 4)
print "total before discount", a.total, "\n"
a.apply_discount
print "total after discount", a.total, "\n"
a.add_item("eggs", 1.99)
a.add_item("tomato", 1.76, 3)
print "total after adding all items", a.total, "\n"

print "all items", a.items, "\n"

print "all transactions", a.transactions, "\n"
test_var = a.transactions.pop()
print "last transaction", test_var, "\n"

test_var.each do |z|
  print z[0], z[1]

end

#a.void_last_transaction
#print a.total
