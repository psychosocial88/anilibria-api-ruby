module Anilibria
  module Api
    module Types
      module DryTypes
        include Dry.Types()

        Timestamp = Constructor(::Time, ::Time.method(:at))
        Success = Constructor(Bool) { |value| value[:success] }
      end
    end
  end
end
