module Anilibria
  module Api
    module Exceptions
      class ResponseError < Base
        attr_reader :response

        def initialize(message, response)
          @response = response
          super(message)
        end
      end
    end
  end
end
