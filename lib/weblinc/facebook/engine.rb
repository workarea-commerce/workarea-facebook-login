module Weblinc
  module Facebook
    class Engine < ::Rails::Engine
      include Weblinc::Plugin
      isolate_namespace Weblinc::Facebook

      config.to_prepare do
        Weblinc::StoreFront::ApplicationController.helper(
          Weblinc::StoreFront::FacebookHelper
        )
      end

      initializer 'weblinc.facebook' do
        Plugin.append_partials(
          'store_front.new_login',
          'weblinc/store_front/facebook'
        )

        Plugin.append_partials(
          'store_front.new_checkout',
          'weblinc/store_front/facebook'
        )

        Plugin.append_partials(
          'store_front.account_section',
          'weblinc/store_front/facebook_account'
        )
      end
    end
  end
end
