class CashRegister
    attr_accessor :total, :discount, :items
    
    def initialize(discount=0)
        @total= 0
        @discount = discount
        @items = []
        @last_item = []
    end
    def total
        @total
    end
    def add_item(title, price, quantity=1)
        @total += price*quantity
        quantity.times do 
            @items << title 
          end
          @last_item = price * quantity
    end
    def apply_discount
        if self.discount != 0
            @discount = @discount/100.to_f
            @total = @total - (@total * (@discount))
            return "After the discount, the total comes to $#{@total.to_i}."
        else
            return "There is no discount to apply."
        end
        
    end
    def items
        @items
    end
    def void_last_transaction
        @items.delete_at(-1)
        self.total = self.total - @last_item
    end
end
