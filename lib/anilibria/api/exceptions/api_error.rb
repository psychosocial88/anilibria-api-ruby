module Anilibria
  module Api
    module Exceptions
      class ApiError < ResponseError
        attr_reader :code

        def initialize(response)
          error = response.body[:error].to_h
          @code = error[:code]

          super(error[:message], response)
        end
      end
    end
  end
end
