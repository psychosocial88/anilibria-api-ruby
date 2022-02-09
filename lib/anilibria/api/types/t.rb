module Anilibria
  module Api
    module Types
      module T
        String = DryTypes::String.optional
        Integer = DryTypes::Integer.optional
        Bool = DryTypes::Bool.optional
        Nil = DryTypes::Nil.optional

        Timestamp = DryTypes.Constructor(Time, Time.method(:at)).optional
        Success = DryTypes.Constructor(Bool) { |value| value[:success] }
      end
    end
  end
end
