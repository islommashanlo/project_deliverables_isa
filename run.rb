require_relative 'app/models/doctors.rb'
require_relative 'app/models/patients.rb'

def doc_or_pat
    puts "Please, identify yourself (doctor/patient)"
    if gets.strip == "doctor"
        def run_doc
            puts "Please enter your name"
            name = gets.strip
            puts "Please type your specialty"
            specialty = gets.strip
            puts "Please enter your years of practice"
            years = gets.strip.to_i
            user = Doctor.new(name, specialty, years)
        end
        run_doc
    elsif gets.strip == "patient"
        def run_pat
            puts "Please enter your name"
            name = gets.strip
            puts "Please enter your age"
            age = gets.strip
            user = Patient.new(name, age)
        end
        run_pat
    else
        puts "Please enter a valid response"
        doc_or_pat
    end
end

doc_or_pat
