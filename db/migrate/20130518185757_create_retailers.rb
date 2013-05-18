class CreateRetailers < ActiveRecord::Migration
  def change
    create_table :retailers do |t|
      t.string :address
      t.string :city
      t.string :province
      t.string :country
      t.string :phone
      t.string :name

      t.timestamps
    end
  end
end
