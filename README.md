Part IV
A Patient has many Doctors through Appointment
A Doctor has many Patients through Appointment
An Appointment belongs to a Doctor and a Patient
Appointment
Appointment#initialize… intentionally vague. What will it need to be initialized?
Appointment.all should return a list of all appointment instances 
Patient
Note: you can comment out your #doctor and #changes_doctors methods
Patient#appointments should return a list of Appointment instances associated with this patient 
Patient#doctors should return a list of Doctor instances associated with this patient through Appointments. Try to ensure this list does not include duplicates.
Patient#create_appointment should create a new appointment between the current patient and a specified doctor
Doctor
Note: you can comment out your #patients, #dischange_patient, and #transfer_patient methods
Doctor#appointments should return a list of Appointment instances associated with this doctor 
Doctor#patients should return a list of Patient instances associated with this patient through Appointments. Try to ensure this list does not include duplicates.
