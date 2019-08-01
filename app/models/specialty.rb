class Specialty < ApplicationRecord
  belongs_to :doctor, optional: true
end
