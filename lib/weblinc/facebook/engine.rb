module Weblinc
  module Facebook
    class Engine < ::Rails::Engine
      include Weblinc::Plugin
      isolate_namespace Weblinc::Facebook

      initializer 'weblinc.facebook' do
        Weblinc::StoreFront.config.javascripts.append(
          'weblinc/store_front/modules/omniauth_facebook.js.erb'
        )

        Weblinc::StoreFront.config.views.logins_section.append(
          'weblinc/store_front/facebook'
        )

        Weblinc::StoreFront.config.views.new_checkout_section.append(
          'weblinc/store_front/facebook'
        )

        Weblinc::StoreFront.config.views.account_section.append(
          'weblinc/store_front/facebook_account'
        )

      end
    end
  end
end
