module Anilibria
  module Api
    module Exceptions
      class AuthError < Base
        attr_reader :data

        def initialize(data = {})
          @data = data

          super("#{mes} (#{key})")
        end

        def err
          data[:err]
        end

        def mes
          data[:mes]
        end

        def key
          data[:key]
        end
      end
    end
  end
end
