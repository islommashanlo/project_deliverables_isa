require 'pry'

class Patient
    attr_accessor :name, :age, :impatience
    @@all = []

    def initialize(name, age)
        @name = name
        @age = age
        @impatience = 0
        @@all.push(self)
    end

    def self.all
        @@all
    end

   def inquire_appt_ready
    puts "The doctor will be with you shortly."
    increase_impatience
   end

   private

   def increase_impatience
    self.impatience += 1
   end

    binding.pry

end
