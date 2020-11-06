require 'pry'
require_relative "./customer.rb"
require_relative "./meal.rb"
class Waiter

    attr_accessor :name, :yrs_exp

    @@all = []

    def initialize(name, yrs_exp)
        @name = name
        @yrs_exp
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip=0)
        Meal.new(self, customer, total, tip)
        # initializes a meal using the current Waiter instance, a provided Customer instance and a total and tip
    end
    
    def meals
        Meal.all.select do |meal|
            meal.waiter == self # checking for waiter now
        end
        # returns an Array of Meal instances associated with this waiter
    end

    def best_tipper
        best_tipped_meal = meals.max do |meal_a, meal_b|  # takes array from #meals and saves as new var
            meal_a.tip <=> meal_b.tip  # .max returns the object in enum with the maximum value
        end
        best_tipped_meal.customer
        # returns the Customer instance associated with the meal that received the largest tip
    end


    # OPTIONAL PRACTICE
    # The meal of a waiter's worst tipping customer
    def worst_tipper_meal
        worst_tip = meals.min do |tip_a, tip_b|
            tip_a.tip <=> tip_b.tip # returns lowest tip
        end
        worst_tip
    end
    # waiter.worst_tipper_meal


    # A waiter's most frequent customer
    
    # The average tips for the most experienced waiter and the average tips for the least experienced waiter
end


customer = Customer.new("maggie", 37)
customer = Customer.new("joe", 28)
waiter = Waiter.new("alex", 4)
waiter2 = Waiter.new("sally", 2)
meal = Meal.new(waiter, customer, 45, 15)
meal2 = Meal.new(waiter, customer, 86, 3)

# binding.pry

# puts "let us pry"


# Notice as well that neither the Customer class, nor the Waiter class needed additional attributes
# they don't need to keep track of this information; they only need to have the methods that ask the write questions
# in this case to the Meal class, the join between customer and waiter