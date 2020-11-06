# single source of truth

class Meal

    attr_accessor :waiter, :customer, :total, :tip

    @@all = []

    def initialize(waiter, customer, total, tip=0)
        @waiter = waiter
        @customer = customer
        @otal = total
        @tip = tip
        @@all << self
    end

    def self.all
        @@all
    end
    
end

# Why associate customers to waiter objects through meals? By associating meals to waiters, 
# we are not only reflecting the real-world situation that our program is meant to model, 
# but we are also creating clean and re-usable code. Each class only knows about what they 
# specifically need to know about, and we create a single source of truth by keeping our information 
# central in our relationship model.