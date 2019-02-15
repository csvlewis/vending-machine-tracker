require 'rails_helper'

describe 'When a user visits a vending machine show page' do
  before :each do
    @owner = Owner.create(name: 'Jeff')
    @machine = Machine.create(location: 'Denver', owner: @owner)
    @snack_1 = @machine.snacks.create(name: 'Cheesy Poofs', price: 1.25)
    @snack_2 = @machine.snacks.create(name: 'Bugles', price: 1.25)
    @snack_3 = @machine.snacks.create(name: 'Breakfast Burrito', price: 2.00)
    @snack_4 = @machine.snacks.create(name: 'Spearmint Gum', price: 0.25)
  end
  it 'they see a list of all snacks in the machine along with their price' do
    visit machine_path(@machine)

    within(class: "snack-#{@snack_1.id}") do
      expect(page).to have_content("Name: #{@snack_1.name}")
      expect(page).to have_content("Price: $#{@snack_1.price}")
    end

    within(class: "snack-#{@snack_2.id}") do
      expect(page).to have_content("Name: #{@snack_2.name}")
      expect(page).to have_content("Price: $#{@snack_2.price}")
    end

    within(class: "snack-#{@snack_3.id}") do
      expect(page).to have_content("Name: #{@snack_3.name}")
      expect(page).to have_content("Price: $#{@snack_3.price}")
    end

    within(class: "snack-#{@snack_4.id}") do
      expect(page).to have_content("Name: #{@snack_4.name}")
      expect(page).to have_content("Price: $#{@snack_4.price}")
    end
  end
  it 'they see an average price for all the snacks in the machine' do
    visit machine_path(@machine)

    within(class: "statistics") do
      expect(page).to have_content("Average Price: $#{@machine.average_price}")
    end
  end
end
