require 'omniauth-oauth2'
require 'multi_json'

module OmniAuth
  module Strategies
    #
    # Authenticate to Scoutforce via OAuth and retrieve basic user information.
    # Usage:
    #    use OmniAuth::Strategies::Scoutforce, 'consumerkey', 'consumersecret', :scope => 'read write', :display => 'plain'
    #
    class Scoutforce < OmniAuth::Strategies::OAuth2
      BASE_URL = 'http://lvh.me:3001'

      option :name, :scoutforce


      option :client_options, {
        :site => BASE_URL,
        :authorize_url => "/v1/oauth/authorize",
        :token_url => "#{BASE_URL}/v1/oauth/token"
      }

      uid { raw_info["id"] }

      info do
        {
          :email => raw_info["email"]
          # and anything else you want to return to your API consumers
        }
      end

      def raw_info
        # puts access_token.params.to_yaml
        @raw_info ||= access_token.get('/api/v1/me.json').parsed
      end
      # AUTHENTICATION_PARAMETERS = %w(display state scope)
      # BASE_URL = 'http://lvh.me:3001'#'https://login.scoutforce.com'

      # option :name, :scoutforce

      # unless OmniAuth.config.test_mode
      #   option :client_options, {
      #     :authorize_url => "#{BASE_URL}/v1/oauth/authorize",
      #     :token_url => "#{BASE_URL}/v1/oauth/token",
      #     :site => BASE_URL
      #   }
      # else
      #   option :client_options, {
      #     :authorize_url => "http://localhost:3000/v1/oauth/authorize",
      #     :token_url => "http://localhost:3000/v1/oauth/token",
      #     :site => "http://localhost:3000"
      #   }
      # end

      # option :authorize_options, AUTHENTICATION_PARAMETERS

      # uid do
      #   access_token.params['uid']
      # end

      # info do
      #   access_token.params['info']
      # end

      # # Hook useful for appending parameters into the auth url before sending
      # # to provider.
      # def request_phase
      #   super
      # end

      # # Hook used after response with code from provider. Used to prep token
      # # request from provider.
      # def callback_phase
      #   super
      # end

      # ##
      # # You can pass +display+, +state+ or +scope+ params to the auth request, if
      # # you need to set them dynamically. You can also set these options
      # # in the OmniAuth config :authorize_params option.
      # #
      # # /v1/auth/scoutforce?display=fancy&state=ABC
      # #
      # def authorize_params
      #   super.tap do |params|
      #     AUTHENTICATION_PARAMETERS.each do |v|
      #       params[v.to_sym] = request.params[v] if request.params[v]
      #     end
      #   end
      # end

    end
  end
end