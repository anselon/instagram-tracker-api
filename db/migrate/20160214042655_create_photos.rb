class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :username
      t.string :src_link
      t.string :native_link

      t.timestamps null: false
    end

    add_index :photos, :native_link , unique: true

  end

  
end
