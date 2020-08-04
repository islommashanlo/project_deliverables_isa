require_relative app/models/doctors.rb
require_relative app/models/patients.rb

def doc_or_pat
    puts "Please, identify yourself (doctor/patient)"
    if gets.strip == "doctor"
        def run_doc
            puts "Please enter your name"
            gets.strip = name
            puts "Please type your specialty"
            gets.strip = specialty
            puts "Please enter your years of practice"
            get.strip.to_i = years
            user = Doc.new(name, specialty, years)
        end
    elsif get.strip == "patient"
        def run_pat
            puts "Please enter your name"
            gets.strip = name
            puts "Please enter your age"
            get.strip = age
        end
    else
        "Please enter a valid response"
    end
end


