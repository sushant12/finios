class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.string :code
      t.string :from
      t.string :to
      t.datetime :date
      t.decimal :price
      t.integer :duration
      t.string :name

      t.timestamps
    end
  end
end
