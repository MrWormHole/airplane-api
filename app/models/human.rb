class Human < ApplicationRecord
  belongs_to :airplane
  validates_presence_of :name,:job
end
