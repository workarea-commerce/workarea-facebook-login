module Weblinc
  module StoreFront
    module Users
      decorate(AccountsController, with: 'weblinc_facebook') do
        decorated do
          helper FacebookHelper
        end
      end
    end
  end
end
