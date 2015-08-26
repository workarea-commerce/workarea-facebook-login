module Weblinc
  module StoreFront
    decorate(CheckoutsController, with: 'weblinc_facebook') do
      decorated do
        helper FacebookHelper
      end
    end
  end
end
