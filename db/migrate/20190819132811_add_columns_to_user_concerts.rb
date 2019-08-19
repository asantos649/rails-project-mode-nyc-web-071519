class AddColumnsToUserConcerts < ActiveRecord::Migration[5.2]
  def change
    add_column :user_concerts, :favorite, :boolean, default: false
    add_column :user_concerts, :favorite_song, :string
    add_column :user_concerts, :rating, :integer
  end
end
