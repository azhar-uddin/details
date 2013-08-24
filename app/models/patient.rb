class Patient < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true
  has_many :appointments
  has_many :doctors, through: :appointments
end
