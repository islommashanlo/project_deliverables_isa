require 'pry'

class Doctor

    attr_accessor :name, :years
    attr_reader :specialty #att_reader allows us to "get" (i.e. read) the value but not change it
    @@all = []
    def initialize(name, specialty, years = 1)
        @name = name
        @specialty = specialty
        @years = years
        @@all.push(self)
    end

    def self.all
        @@all
    end

    def greet
        puts "Hi! How are you doing today? I apologize for the wait."
    end

    def self.find_by_specialty(specs)
        self.all.select do |doctor|
            doctor.specialty == specs
        end
    end
    binding.pry
end
