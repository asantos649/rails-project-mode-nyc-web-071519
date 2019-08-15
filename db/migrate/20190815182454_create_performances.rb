class CreatePerformances < ActiveRecord::Migration[5.2]
  def change
    create_table :performances do |t|
      t.references :concert, foreign_key: true
      t.references :band, foreign_key: true
      t.boolean :opener

      t.timestamps
    end
  end
end
