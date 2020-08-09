class Appointments
    attr_accessor :doctor, :patient

    @@all = []

    def initialize(patient, doctor)
        @doctor = doctor
        @patient = patient
        @@all.push(self)
    end

    def self.all
        @@all
    end


end
