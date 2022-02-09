module Anilibria
  module Api
    module Types
      class YouTube < Base
        attribute? :id, T::Integer
        attribute? :image, T::String
        attribute? :youtube_id, T::String
        attribute? :comments, T::Integer
        attribute? :views, T::Integer
        attribute? :timestamp, T::Timestamp
      end
    end
  end
end
