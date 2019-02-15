require 'rails_helper'

describe 'When a user visits a snack show page' do
  before :each do
    @owner = Owner.create(name: 'Jeff')
    @snack_1 = Snack.create(name: 'Cheesy Poofs', price: 1.25)
    @snack_2 = Snack.create(name: 'Bugles', price: 1.25)
    @snack_3 = Snack.create(name: 'Breakfast Burrito', price: 2.00)
    @snack_4 = Snack.create(name: 'Spearmint Gum', price: 0.25)
    @snack_5 = Snack.create(name: 'Muffins', price: 2.50)
    @machine_1 = Machine.create(location: 'Snack Shack', owner: @owner, snacks: [@snack_1, @snack_4])
    @machine_2 = Machine.create(location: 'Dave\'s Snack Emporium', owner: @owner, snacks: [@snack_1, @snack_2, @snack_3])
    @machine_3 = Machine.create(location: 'The Wonderful World of Snacks', owner: @owner, snacks: [@snack_2, @snack_3, @snack_4])
  end
  it 'they see the name and price of the snack' do
    visit snack_path(@snack_1)

    expect(page).to have_content(@snack_1.name)
    expect(page).to have_content(@snack_1.price)

  end

  it 'they see a list of locations with vending machines that carry the snack' do
  end

  it 'each location lists the kinds of snacks available and their average price' do
  end
end
