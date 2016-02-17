class PhotoCollection < ActiveRecord::Base
  has_many :taggings
  has_many :photos, :through => :taggings

  def fetch_and_save_photos

    instagrams = Instagram.tag_recent_media(self[:tag], :count=>33)
    
    next_max_tag_id = instagrams.pagination.next_max_tag_id
    
    #while !(next_max_tag_id.to_s.empty?) do
    10.times do
      instagrams.each do |media_item|

        username = media_item.caption.from.username
        src_link = media_item.images.standard_resolution.url
        native_link = media_item.link
        #check if hashtag is in caption 
        created_time = Time.zone.now

        if !(media_item.caption.text =~  /#{Regexp.quote(self[:tag])}/i).nil?
   
          created_time = Time.zone.at(media_item.created_time.to_i)

        else
          #get comment with hash tag
          comments = Instagram.media_comments(media_item.id)
          comments.each do |comment|
            puts comment.text
            if !(comment.text =~  /#{Regexp.quote(self[:tag])}/i).nil?
              created_time = Time.zone.at(comment.created_time.to_i)
            end
          end
        end

        if created_time <= self[:end_date] and created_time >= self[:start_date]
          #add photo to collection if unique 
          @photo = Photo.find_by(:native_link => native_link)
          if @photo.nil?
            @photo = self.photos.create(:username => username, :native_link => native_link, :src_link => src_link) 
          end
          @photo.taggings.create(:photo_collection_id => self[:id], :tag_time => created_time)
        end

      end

      instagrams = Instagram.tag_recent_media(self.tag, :max_tag_id => next_max_tag_id, :count=>33 )
      next_max_tag_id  = instagrams.pagination.next_max_tag_id
    end


  end


end

