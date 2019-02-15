require 'rails_helper'

describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
  end

  describe 'relationships' do
    it { should have_many :snacks }
    it { should belong_to :owner }
  end

  describe 'instance methods' do
    describe '.average_price' do
      it 'returns the average price for all items in a machine' do
        owner = Owner.create(name: 'Jeff')
        machine = Machine.create(location: 'Denver', owner: owner)
        machine.snacks.create(name: 'Cheesy Poofs', price: 2.00)
        machine.snacks.create(name: 'Bugles', price: 1.00)

        expect(machine.average_price).to eq(1.50)
      end
    end
  end
end
