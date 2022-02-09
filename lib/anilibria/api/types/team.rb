module Anilibria
  module Api
    module Types
      class Team < Base
        %i[voice translator editing decor timing].each do |t|
          attribute? t, DryTypes::Array.of(DryTypes::String)
        end
      end
    end
  end
end
