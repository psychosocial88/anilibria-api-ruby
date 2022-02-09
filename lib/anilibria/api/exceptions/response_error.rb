module Anilibria
  module Api
    module Exceptions
      class ResponseError < Base
        attr_reader :response

        def initialize(msg = nil, response = nil)
          @response = response

          super(msg)
        end
      end
    end
  end
end
