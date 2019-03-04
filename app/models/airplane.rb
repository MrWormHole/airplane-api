class Airplane < ApplicationRecord
  has_many :humen,dependent: :destroy
  validates_presence_of :specificID, :name
end
