module Weblinc
  module Authentication
    decorate(SessionProvider, with: 'weblinc_facebook') do
      class_methods do
        def logout
          if current_user && current_user.is_omniauthed?
            user = current_user
            user.is_omniauthed = false
            user.save
          end
          super
        end
      end
    end
  end
end
