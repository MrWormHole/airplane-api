require 'rails_helper'

RSpec.describe Airplane, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  # Association test
  # ensure Airplane model has a 1:m relationship with Human model
  it { should have_many(:humen).dependent(:destroy) }
  # Validation tests
  # ensure columns title and created_by are present before saving
  it { should validate_presence_of(:specificID) }
  it { should validate_presence_of(:name) }
end
