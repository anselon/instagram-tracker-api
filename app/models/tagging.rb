class Tagging < ActiveRecord::Base
  belongs_to :photo
  belongs_to :photo_collection

  attr_accessor :tag_time

end
