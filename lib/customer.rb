require 'pry'
class Customer
 
    attr_accessor :name, :age

    @@all = []

    def initialize(name, age)
        @name = name
        @age = age
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(waiter, total, tip=0)
        Meal.new(waiter, self, total, tip) # self being current instance of customer (name and age)
        #  allow us to create new meals as a customer, and automatically 
        # associate each new meal with the customer that created it.
    end

    def meals
        Meal.all.select do |meal|
            meal.customer == self
            #returns an Array of Meal instances associated with this customer
        end
    end

    def waiters
        meals.map do |meal|
            meal.waiter
        end
        # returns an Array of Waiter instances associated with this customer's meals
    end

    def new_meal(waiter, total, tip=0)
        Meal.new(waiter, self, total, tip)
        # initializes a meal using the current Customer instance, a provided Waiter instance and a total and tip
    end
    
    def new_meal_20_percent(waiter, total) # takes in waiter name/exp and total bill amount
        tip = total * 0.2  # calculates a 20% tip
        Meal.new(waiter, self, total, tip)  
        # new Meal initialized with waiter name/age, customer name/age, total bill, and 20% tip
    end
    
    def self.oldest_customer # "Are you my oldest customer?"
        oldest_age = 0
        oldest_customer = nil
        self.all.each do |customer| # runs all instances in Customer class and parses out each customer
          if customer.age > oldest_age  # if customer's age is > 0
            oldest_age = customer.age  # then 0 is now customer's age (ex. 18)
            oldest_customer = customer  # and var oldest_customer is the instance customer
          end  # so yes, you ARE my oldest customer
        end
        oldest_customer  # otherwise, you are not my oldest customer
    end

    def frequent_customer
        
    end

#binding.pry
end

# A waiter's most frequent customer
# The meal of a waiter's worst tipping customer
# The average tips for the most experienced waiter and the average tips for the least experienced waiter

# Notice as well that neither the Customer class, nor the Waiter class needed additional attributes
# they don't need to keep track of this information; they only need to have the methods that ask the write questions
# in this case to the Meal class, the join between customer and waiter