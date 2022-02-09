module Anilibria
  module Api
    module Types
      class SeedStats < Base
        attribute? :downloaded, T::Integer
        attribute? :uploaded, T::Integer
        attribute? :user, T::String
      end
    end
  end
end
