require 'faker'

Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all
Field.destroy_all
City.destroy_all

#Generate a bunch of specialties
specialty_1 = Specialty.create(name: "Généraliste")
specialty_2 = Specialty.create(name: "Urologue")
specialty_3 = Specialty.create(name: "Kinesithérapeute")
specialty_4 = Specialty.create(name: "Pédiatre")
specialty_5 = Specialty.create(name: "Chirurgien")
specialty_6 = Specialty.create(name: "Chirurgien_Dentiste")
t_specialties = []
t_specialties << specialty_1
t_specialties << specialty_2
t_specialties << specialty_3
t_specialties << specialty_4
t_specialties << specialty_5
t_specialties << specialty_6

#Generate a bunch of cities
city_1 = City.create(name: 'Montpellier')
city_2 = City.create(name: 'Bordeaux')
city_3 = City.create(name: 'Paris')
city_4 = City.create(name: 'Lille')
t_cities = []
t_cities << city_1
t_cities << city_2
t_cities << city_3
t_cities << city_4
#Generate k entries the BDD with connexions
k = 12
k.times do
  doctor = Doctor.create(first_name: "Dr.#{Faker::Name.first_name}", last_name: Faker::Name.last_name, zip_code: Faker::Address.zip)
  doctor.city = t_cities.sample #Generate a random city for doctor
  doctor.save
  patient = Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
  patient.city = t_cities.sample #add city to patient
  patient.save
  appointment = Appointment.create(date: Faker::Date.forward(days: 23), doctor: Doctor.all.sample, patient: Patient.all.sample)#create appointment
  appointment.city = t_cities.sample#add city to appointment
  appointment.save
  #add 2 specialties per doctor
  field =  Field.create(doctor: doctor, specialty: t_specialties.sample)
  field2 =  Field.create(doctor: doctor, specialty: t_specialties.sample)
end
