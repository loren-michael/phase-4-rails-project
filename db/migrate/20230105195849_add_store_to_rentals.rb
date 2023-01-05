class AddStoreToRentals < ActiveRecord::Migration[6.1]
  def change
    add_reference :rentals, :store, index: true, null: false, foreign_key: true
  end
end
