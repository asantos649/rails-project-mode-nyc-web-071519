class CreateConcerts < ActiveRecord::Migration[5.2]
  def change
    create_table :concerts do |t|
      t.datetime :date_and_time
      t.string :name
      t.string :location

      t.timestamps
    end
  end
end
