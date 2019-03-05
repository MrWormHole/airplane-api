class Airplane < ApplicationRecord
  has_many :humen,dependent: :destroy
  validates_presence_of :specificID, :name #TODO any other way to do this specificID?
end
