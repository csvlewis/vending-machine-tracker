require 'rails_helper'

describe Snack, type: :model do
  describe 'relationships' do
    it { should have_many :machines }
  end
end
