class Photo < ActiveRecord::Base
  has_many :taggings
  has_many :photo_collections, :through => :taggings

  validates_uniqueness_of :native_link

end
