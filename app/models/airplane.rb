class Airplane < ApplicationRecord
  has_many :humen,dependent: :destroy
  validates_presence_of :name , :flying_hours
end
