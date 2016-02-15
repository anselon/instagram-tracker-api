class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.belongs_to :photo, index:true
      t.belongs_to :photo_collection, index:true
      t.datetime :tag_time
      t.references :photo, index: true, foreign_key: true
      t.references :photo_collection, index: true, foreign_key: true

      t.timestamps null: false
    end

  end
end
