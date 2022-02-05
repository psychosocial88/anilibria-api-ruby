module Anilibria
  module Api
    module Exceptions
      class AuthError < Base
        attr_reader :err, :key, :mes

        def initialize(response_body)
          @err = response_body[:err]
          @key = response_body[:key]
          @mes = response_body[:mes]
          super("#{mes} (#{key})")
        end
      end
    end
  end
end
