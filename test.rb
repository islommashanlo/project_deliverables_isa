require_relative 'app/models/Doctors.rb'
require_relative 'app/models/Patients.rb'
require_relative 'app/models/Appointments.rb'
require "pry"

elyssa = Doctor.new("Elyssa", "surgeon", 5)
augusta = Doctor.new("Augusta", "pediatrist", 3)
minerva = Doctor.new("Minerva", "intern")

isa = Patient.new("Isa", "24")
paulina = Patient.new("Paulina", "25")
victoria = Patient.new("Victoria", "22")
alina = Patient.new("Alina", "44")

Appointments.new(isa, elyssa)
Appointments.new(isa, augusta)
Appointments.new(isa, minerva)
Appointments.new(paulina, elyssa)
Appointments.new(victoria, augusta)
Appointments.new(victoria, minerva)
Appointments.new(alina, minerva)

existing_patients = [
    Patient.new("Isa", "24"), 
    Patient.new("Paulina", "25"), 
    Patient.new("Victoria", "22"), 
    Patient.new("Alina", "44")
    ]  

    binding.pry