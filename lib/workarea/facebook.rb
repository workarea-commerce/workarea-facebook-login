require "workarea"
require "workarea/storefront"
require "omniauth-facebook"

module Workarea
  module Facebook
    def self.configure_omniauth_middleware
      Rails.application.config.middleware.use OmniAuth::Builder do
        provider :facebook, Facebook.config[:key], Facebook.config[:secret], Facebook.middleware_options
      end
    end

    def self.config
      @config ||= (Rails.application.secrets.facebook_login || {}).deep_symbolize_keys
    end

    def self.middleware_options
      {
        scope: "public_profile,email",
        info_fields: "email,name,first_name,last_name",
        client_options: {
          site: "https://graph.facebook.com/v2.9",
          authorize_url: "https://www.facebook.com/v2.9/dialog/oauth"
        },
        token_params: { parse: :json }
      }
    end

    def self.auth_path
      "/auth/facebook/"
    end
  end
end

require "workarea/facebook/version"
require "workarea/facebook/engine"
