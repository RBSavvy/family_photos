class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name

      t.timestamps
    end

    add_column :photos, :album_id, :integer
  end
end
