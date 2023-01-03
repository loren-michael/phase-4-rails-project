class CreateCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :carts do |t|
      t.string :status, default: "current"

      t.timestamps
    end
  end
end
