module Anilibria
  module Api
    module Types
      class SeedStats < Base
        attribute? :downloaded, DryTypes::Strict::Integer
        attribute? :uploaded, DryTypes::Strict::Integer
        attribute? :user, DryTypes::Strict::String
      end
    end
  end
end
