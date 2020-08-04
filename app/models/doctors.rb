require 'pry'

class Doctor

    attr_accessor :name, :years
    attr_reader :specialty #att_reader allows us to "get" (i.e. read) the value but not change it

    def initialize(name, specialty, years = 1)
        @name = name
        @specialty = specialty
        @years = years

    end

end
