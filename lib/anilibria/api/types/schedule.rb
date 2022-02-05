module Anilibria
  module Api
    module Types
      class Schedule < Base
        attribute :day, DryTypes::Strict::Integer
        attribute :list, DryTypes::Array.of(Title)
      end
    end
  end
end
