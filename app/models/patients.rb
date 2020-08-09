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


   def appointments
        Appointments.all.select do |e|
            e.patient == self
        end
    end

    def doctors
        self.appointments.map do |p|
            p.doctor
        end
    end

    def list_pat_doctors
        self.appointments.each do |p|
            puts "#{p.doctor}"
        end
    end

    def create_appointment(doctor)
        if doctors.each{|e|e.name = doctor}.any?
            puts "You already have an appointment with #{doctor.capitalize}"
        else
            puts "An appointment has been created with #{doctor.capitalize}"
            Appointments.new(self, doctor)
        end
    end

    def self.find_by_name(pat)
        self.all.find do |e|
            e.name == pat
        end
    end


   private

   def increase_impatience
    self.impatience += 1
   end

end
