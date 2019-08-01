class Doctor < ApplicationRecord
  has_many :appointments
  has_many :patients, through: :appointments
  belongs_to :city,  optional: true
  has_many :fields
  has_many :specialties, through: :fields
end
