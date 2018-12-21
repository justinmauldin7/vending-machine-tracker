require 'rails_helper'

describe "as a user" do
  describe "on the vending machine show page" do
    before(:each) do
      @owner = Owner.create(name: "Sam's Snacks")
      @snack_1 = Snack.create(name: "Snickers", price: 225)
      @snack_2 = Snack.create(name: "Reeces", price: 275)
      @snack_3 = Snack.create(name: "Twix", price: 225)
      @snack_4 = Snack.create(name: "Cheetos", price: 275)
      # @machine_1  = Machine.create(owner_id: owner, location: "Don's Mixed Drinks")
      @machine_1  = Machine.create(owner_id: @owner, location: "Don's Mixed Drinks", snacks: [@snack_1, @snack_2, @snack_3, @snack_4])

      # @rel_1 = MachineSnacks.create(machine_id: machine_1, snack_id: snack_1)
      # @rel_2 = MachineSnacks.create(machine_id: machine_1, snack_id: snack_2)
      # @rel_3 = MachineSnacks.create(machine_id: machine_1, snack_id: snack_3)
      # @rel_4 = MachineSnacks.create(machine_id: machine_1, snack_id: snack_4)
    end
binding.pry
    it "shows list of all snacks for that machine" do
      visit machine_path

      within "#snack-#{@snack_1.id}" do
        expect(page).to have_content(@snack_1.name)
        expect(page).to have_content(@snack_1.price)
      end
      within "#snack-#{@snack_2.id}" do
        expect(page).to have_content(@snack_2.name)
        expect(page).to have_content(@snack_2.price)
      end
      within "#snack-#{@snack_3.id}" do
        expect(page).to have_content(@snack_3.name)
        expect(page).to have_content(@snack_3.price)
      end
      within "#snack-#{@snack_4.id}" do
        expect(page).to have_content(@snack_4.name)
        expect(page).to have_content(@snack_4.price)
      end
    end
    it 'shows average price of all snacks' do
      visit machine_path

      expect(page).to have_content(@machine_1.average_price)
    end
  end
end
