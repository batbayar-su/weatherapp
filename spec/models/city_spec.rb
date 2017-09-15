require 'rails_helper'

RSpec.describe City, type: :model do
  # testing validations
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:country) }
end
