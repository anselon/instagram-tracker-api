class PhotoCollection < ActiveRecord::Base
  has_many :taggings
  has_many :photos, :through => :taggings

  def fetch_and_save_photos

    instagrams = Instagram.tag_recent_media(self[:tag])
    
    next_max_tag_id = instagrams.pagination.next_max_tag_id
    
    while !(next_max_tag_id.to_s.empty?) do

      instagrams.each do |media_item|

        username = media_item.username
        src_link = media_item.images.standard_resolution.url
        native_link = media_item.link
        created_time = Time.zone.at(media_item.created_time.to_i)
        if created_time <= self[:end_date] and created_time >= self[:start_date]
          #add photo to collection
          @photo = Photo.find_by(:native_link => native_link)
          if @photo.nil?
            @photo = self.photos.create(:username => username, :native_link => native_link, :src_link => src_link) 
          end
          @photo.taggings.create(:photo_collection_id => self[:id], :tag_time => created_time)
        end

      end

      instagrams = Instagram.tag_recent_media(self.tag, :max_tag_id => next_max_tag_id )
      next_max_tag_id  = instagrams.pagination.next_max_tag_id
    end


  end


end

