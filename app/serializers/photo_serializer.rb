class PhotoSerializer < ActiveModel::Serializer
  attributes :id, :username, :src_link, :native_link
end
