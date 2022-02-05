module Anilibria
  module Api
    module Types
      class YouTube < Base
        attribute? :id, DryTypes::Strict::Integer
        attribute? :image, DryTypes::Strict::String
        attribute? :youtube_id, DryTypes::Strict::String
        attribute? :comments, DryTypes::Strict::Integer
        attribute? :views, DryTypes::Strict::Integer
        attribute? :timestamp, DryTypes::Timestamp
      end
    end
  end
end
