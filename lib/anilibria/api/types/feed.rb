module Anilibria
  module Api
    module Types
      Feed = DryTypes::Array.of(
        DryTypes.Constructor(Types::Base) do |i|
          case i.keys.first
          when :title then Types::Title.new(i[:title])
          when :youtube then Types::YouTube.new(i[:youtube])
          end
        end
      )
    end
  end
end
