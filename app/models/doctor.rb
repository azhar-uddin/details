class Doctor < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true
  has_many :appointments
  has_many :patients, through: :appointments
end
