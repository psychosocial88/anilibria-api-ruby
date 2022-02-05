module Anilibria
  module Api
    class Client
      class << self
        def api_method(method_name, api_method_name = nil, returns:, http_method: :get)
          (@api_methods ||= []) << method_name.to_sym
          api_method_name ||= camelize(method_name.to_s)

          define_method(method_name) do |params = {}|
            response_body = call(api_method_name, params, http_method)
            returns[response_body]
          end
        end

        def api_methods
          (@api_methods ||= []).dup
        end

        private

        def camelize(method_name)
          words = method_name.split('_')
          words.drop(1).map(&:capitalize!)
          words.join
        end
      end

      DryTypes = Types::DryTypes

      API_VERSION = '2.13'.freeze
      public_constant :API_VERSION

      ENDPOINT = "https://api.anilibria.tv/v#{API_VERSION}".freeze
      public_constant :ENDPOINT

      AUTH_ENDPOINT = 'https://www.anilibria.tv/public/login.php'.freeze
      public_constant :AUTH_ENDPOINT

      attr_reader :connection

      def initialize(url: ENDPOINT)
        @connection = Faraday.new(url: url) do |f|
          f.request :url_encoded
          f.response :json, parser_options: { symbolize_names: true }
        end
      end

      def call(method_name, params = {}, http_method = :get)
        http_method = :get unless %i[get post put patch delete].include?(http_method)
        response = connection.public_send(http_method, method_name) do |req|
          req.params.merge!(params)
        end

        check_response!(response)
        response.body
      end

      def auth(mail, passwd)
        response = auth_response(mail, passwd)

        return unless response[:key] == 'success'

        response[:sessionId]
      end

      def auth!(mail, passwd)
        response = auth_response(mail, passwd)

        raise Exceptions::AuthError, response unless response[:key] == 'success'

        response[:sessionId]
      end

      def api_version
        connection.get.headers['api-version']
      end

      private

      def auth_response(mail, passwd)
        response = connection.post(
          AUTH_ENDPOINT,
          { mail: mail, passwd: passwd }
        )

        JSON.parse(response.body, { symbolize_names: true })
      end

      def check_response!(response)
        return if response.status == 200

        if !response.body.respond_to?(:to_hash) || !response.body.key?(:error)
          raise Exceptions::ResponseError.new('Unexpected response from API', response)
        end

        raise Exceptions::ApiError, response
      end
    end
  end
end

require 'anilibria/api/client/_methods'
