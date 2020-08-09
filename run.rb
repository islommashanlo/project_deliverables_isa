require_relative 'app/models/Doctors.rb'
require_relative 'app/models/Patients.rb'
require_relative 'app/models/Appointments.rb'
require "pry"

#existing_doctors
    Doctor.new("Elyssa", "surgeon", 5)
    Doctor.new("Augusta", "pediatrist", 3)
    Doctor.new("Minerva", "general practicioner")

#existing_patients = 
    Patient.new("Isa", "24")
    Patient.new("Paulina", "25")
    Patient.new("Victoria", "22")
    Patient.new("Alina", "44")


def sign_up
    puts "Please identify yourself so the system can assisst you. (patient/doctor)"
    input = gets.strip
    if input == "patient"
        puts "Please enter your name"
        pat_name_su = gets.strip.capitalize
        puts "Please enter your age"
        pat_age_su = gets.strip
        Patient.new(pat_name_su, pat_age_su)
        puts "Welcome #{pat_name_su}! Please login to use your account."
        login
    elsif input == "doctor"
        puts "Please enter your name"
        doc_name_su = gets.strip.capitalize
        puts "Please enter your specialty"
        doc_spec_su = gets.strip
        puts "Please enter your years of experience"
        doc_years_su = gets.strip.to_i
        Doctor.new(doc_name_su, doc_spec_su, doc_years_su)
        puts "Welcome Dr. #{doc_name_su}! Please login to use your account"
        login
    else 
        puts "Please enter a valid response"
        sign_up
    end
end


def login
    puts "Welcome to the Social Medical Centre's System"
    puts "Please identify yourself so the system can assisst you. (patient/doctor)"
    input = gets.strip
    if input == "patient"
        puts "Please enter your name"
        pat_name = gets.strip.capitalize
        if Patient.all.any? {|patient| patient.name == pat_name.capitalize}
             puts "Hello #{pat_name.capitalize}"
             puts "What would you like to do? (app/check)"
             resp_pat = gets.strip
             if resp_pat == "appointment"
                puts "If you know the name of the doctor please type, otherwise type a specialty to find your needed doctor"
                doc_or_spec = gets.strip
                if Doctor.find_by_specialty(doc_or_spec).any?
                   app_doc = Doctor.find_by_specialty(doc_or_spec)
                   Patient.find_by_name(pat_name).create_appointment(app_doc)
                elsif Patient.find_by_name(pat_name).doctors.each{|e|e.name = doc_or_spec.capitalize}.any?
                    puts "You already have an appointment with Dr. #{doc_or_spec.capitalize}"
                else
                    Patient.find_by_name(pat_name).create_appointment(doc_or_spec.capitalize)
                end
             elsif resp_pat == "check"
                puts Patient.all.find_by_name(pat_name).doctors
             else
                 puts "Please enter a valid response" #I do not know how to go back to the beginning of the conditional without
                                                      #rewriting the code
             end
        else 
            puts "You do not seem to be in our system."
            puts "Would you like to sign up? (y/n)"
            y_or_n = gets.strip
            if y_or_n == "y" or y_or_n == "yes"
                sign_up
            elsif y_or_n == "n" or y_or_n == "no"
                puts "Okay, goodbye! And thank you for visiting the Social Medical Centre! We hope you come back!"
            else 
                puts "Please enter a valid response"
            end
        end
    elsif input == "doctor"
        puts "Please enter your name"
        doc_name = gets.strip.capitalize
        if Doctor.all.any? {|doctor| doctor.name == doc_name.capitalize}
            puts "Hello Dr. #{doc_name.capitalize}, what would you like to do? (admit/check)"
            resp_doc = gets.strip
            if resp_doc == "check"
                Doctor.find_by_name(doc_name.capitalize).list_pat_doctors
            elsif resp_doc == "admit"
                Doctor.find_by_name(doc_name.capitalize).greet
            else 
                puts "Please enter a valid response"  #I do not know how to go back to the beginning of the conditional without
                                                      #rewriting the code
            end
             
        else
            puts "You do not seem to be in our system."
            puts "Would you like to sign up? (y/n)"
            y_or_n = gets.strip
            if y_or_n == "y" or y_or_n == "yes"
                sign_up
            elsif y_or_n == "n" or y_or_n == "no"
                puts "Okay, goodbye! And thank you for visiting the Social Medical Centre, and we hope you come back!"
            else 
                puts "Please enter a valid response" #I do not know how to go back to the beginning of the conditional without
                                                     #rewriting the code
            end
        end
    else 
        puts "Please enter a valid response"
        login
    end   
end

login
